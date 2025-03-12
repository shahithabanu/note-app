from sqlalchemy import Column, String, DateTime
from sqlalchemy.dialects.mysql import TIMESTAMP
from datetime import datetime
import uuid
from db import Base
from passlib.context import CryptContext
from sqlalchemy.orm import validates
from models import Note, NoteModel, get_db


class User(Base):
    __tablename__ = "users"

    user_id = Column(String(36), primary_key=True, default=lambda: str(uuid.uuid4()))
    user_name = Column(String(100), nullable=False)
    user_email = Column(String(100), unique=True, nullable=False)
    password = Column(String(255), nullable=False)
    last_update = Column(TIMESTAMP, nullable=True, default=datetime.utcnow)
    created_on = Column(TIMESTAMP, nullable=False, default=datetime.utcnow)

    # Password hashing context
    pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

    # Password hashing
    @validates('password')
    def hash_password(self, key, password):
        return self.pwd_context.hash(password)
        
# Password hashing context
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


        # Pydantic model for user registration
class UserCreate(BaseModel):
    user_name: str
    user_email: EmailStr
    password: str
# Note model
class Note(Base):
    __tablename__ = "notes"

    note_id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.user_id"), nullable=False)
    note_title = Column(String, nullable=False)
    note_content = Column(Text, nullable=False)
    created_on = Column(DateTime, nullable=False)

# Optional: NoteModel may need to be defined like this
class NoteModel(Base):
    __tablename__ = "note_model"
    note_id = Column(String, primary_key=True)
    note_title = Column(String, nullable=False)
    note_content = Column(Text, nullable=False)