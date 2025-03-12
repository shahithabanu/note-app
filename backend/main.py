from fastapi import FastAPI, HTTPException, Request, Depends
from pydantic import BaseModel
from sqlalchemy import create_engine, Column, String, Text, TIMESTAMP, func
from sqlalchemy.orm import sessionmaker, declarative_base, Session
from fastapi.middleware.cors import CORSMiddleware
from passlib.context import CryptContext
from uuid import uuid4
from datetime import datetime
from typing import List
from uuid import UUID

# MySQL database connection
DATABASE_URL = "mysql+pymysql://root:Admin@localhost/notes_app"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

# Password hashing context
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# FastAPI app initialization
app = FastAPI()

# Middleware for CORS (Cross-Origin Resource Sharing)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"], 
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Database model for notes
# Database model for notes
class NoteModel(Base):
    __tablename__ = "notes"

    note_id = Column(String(36), primary_key=True, index=True)
    note_title = Column(String(255), nullable=False)
    note_content = Column(Text, nullable=False)
    user_id = Column(String(36), nullable=False)  # Ensure this column exists
    created_on = Column(TIMESTAMP, server_default=func.current_timestamp())
    last_update = Column(TIMESTAMP, server_default=func.current_timestamp(), onupdate=func.current_timestamp())

# Database model for users
class UserModel(Base):
    __tablename__ = "users"

    user_id = Column(String(36), primary_key=True, index=True)
    user_name = Column(String(255), nullable=False)
    user_email = Column(String(255), unique=True, nullable=False)
    password = Column(String(255), nullable=False)
    created_on = Column(TIMESTAMP, server_default=func.current_timestamp())
    last_update = Column(TIMESTAMP, server_default=func.current_timestamp(), onupdate=func.current_timestamp())

# Create tables in the database
Base.metadata.create_all(bind=engine)

# Pydantic model for request body
class Note(BaseModel):
    note_title: str
    note_content: str

class UserCreate(BaseModel):
    user_name: str
    user_email: str
    password: str

class UserLogin(BaseModel):
    user_email: str
    password: str



class SignInRequest(BaseModel):
    email: str
    password: str
    
class NoteResponse(BaseModel):
    note_id: str
    note_title: str
    note_content: str
    last_update: datetime
    created_on: datetime

    class Config:
        orm_mode = True
        json_encoders = {
            datetime: lambda v: v.isoformat()  # Convert datetime to ISO 8601 string
        }

# Dependency for database session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
# Endpoint to create a new note
@app.post("/notes/")
async def create_note(note: Note, request: Request, db: Session = Depends(get_db)):
    try:
        body = await request.json()
        print("Received Request Body:", body)

        # Get the user_id from the request
        user_id = body.get("user_id")
        if not user_id:
            raise HTTPException(status_code=400, detail="User ID is required")

        new_note = NoteModel(
            note_id=str(uuid4()),
            note_title=note.note_title,
            note_content=note.note_content,
            user_id=user_id,  # Associate the note with a user_id
        )
        db.add(new_note)
        db.commit()
        db.refresh(new_note)

        return {"message": "Note created successfully", "note": new_note}
    except Exception as e:
        print(f"Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

# Endpoint to fetch notes by user_id
@app.get("/notes/{user_id}", response_model=List[NoteResponse])
async def get_notes(user_id: UUID, db: Session = Depends(get_db)):
    notes = db.query(NoteModel).filter(NoteModel.user_id == str(user_id)).all()
    if not notes:
        raise HTTPException(status_code=404, detail="No notes found for this user")
    return notes


@app.delete("/notes/{note_id}")
def delete_note(note_id: str, db: Session = Depends(get_db)):
    try:
        note = db.query(NoteModel).filter(NoteModel.note_id == note_id).first()
        if not note:
            raise HTTPException(status_code=404, detail="Note not found")

        db.delete(note)
        db.commit()

        return {"message": "Note deleted successfully"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.put("/notes/{note_id}")
async def update_note(note_id: str, note: Note, request: Request, db: Session = Depends(get_db)):
    try:
        body = await request.json()
        print("Received Request Body for Update:", body)  # Log the incoming data

        existing_note = db.query(NoteModel).filter(NoteModel.note_id == note_id).first()

        if not existing_note:
            raise HTTPException(status_code=404, detail="Note not found")

        # Update note fields
        existing_note.note_title = note.note_title
        existing_note.note_content = note.note_content

        db.commit()
        db.refresh(existing_note)

        return {"message": "Note updated successfully", "note": existing_note}
    except Exception as e:
        print(f"Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/signup")
async def signup(user: UserCreate, db: Session = Depends(get_db)):
    db_user = db.query(UserModel).filter(UserModel.user_email == user.user_email).first()
    if db_user:
        raise HTTPException(status_code=400, detail="Email already registered")
    
    hashed_password = pwd_context.hash(user.password)
    new_user = UserModel(
        user_id=str(uuid4()),  # Generate user_id here
        user_name=user.user_name,
        user_email=user.user_email,
        password=hashed_password,
        created_on=datetime.now(),
        last_update=datetime.now()
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    # Return user_id along with success message
    return {"message": "User created successfully", "user_id": new_user.user_id}



# Signin route
@app.post("/signin")
async def signin(user: UserLogin, db: Session = Depends(get_db)):
    db_user = db.query(UserModel).filter(UserModel.user_email == user.user_email).first()
    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")
    
    if not pwd_context.verify(user.password, db_user.password):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    return {
        "success": True,
        "message": "Sign-in successful",
        "user_name": db_user.user_name,
        "user_id": db_user.user_id
    }

    
@app.get("/notes/{user_id}", response_model=List[NoteResponse])
async def get_notes(user_id: str, db: Session = Depends(get_db)):
    try:
        notes = db.query(NoteModel).filter(NoteModel.user_id == user_id).all()
        if not notes:
             return []
        return notes
    except Exception as e:
        print(f"Error fetching notes for user {user_id}: {str(e)}")
        raise HTTPException(status_code=500, detail="Error fetching notes.")


