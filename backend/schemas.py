from datetime import datetime
from pydantic import BaseModel, EmailStr

# User Schemas
class UserCreate(BaseModel):
    user_name: str
    user_email: EmailStr
    password: str

class UserLogin(BaseModel):
    user_email: EmailStr
    password: str

# Note Schemas
class NoteCreate(BaseModel):
    note_title: str
    note_content: str

class NoteResponse(NoteCreate):
    note_id: str
    created_on: datetime
    last_update: datetime

    class Config:
        orm_mode = True

class TokenResponse(BaseModel):
    access_token: str
    token_type: str