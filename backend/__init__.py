from sqlalchemy import create_engine, Column, String, Text, TIMESTAMP, func
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

class Note(Base):
    __tablename__ = "notes"
    note_id = Column(String, primary_key=True)
    note_title = Column(String, nullable=False)
    note_content = Column(Text, nullable=False)

def get_db():
    # Returns a session or a DB connection
    pass
