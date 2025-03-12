A full-stack notes-taking application built with Next.js (React) for the frontend, FastAPI for the backend, and MySQL as the database. The app allows users to sign up, sign in, and create, view, edit, and delete notes with an intuitive UI and persistent storage.

** Features**

User Authentication (Sign Up & Sign In)
CRUD Operations for Notes (Create, Read, Update, Delete)
Axios for API Calls
FastAPI for Backend with RESTful APIs
MySQL Database for storing users and notes
Responsive UI with styled components
Rich Text Editor for Notes 

**
Tech Stack
Frontend:
**

Next.js (React)

Axios (for API requests)

CSS/Styled Components


Backend:

FastAPI (Python)
MySQL (Database)


1.Clone the Repository:

git clone https://github.com/your-username/note-app.git
cd note-app

2. Backend Setup (FastAPI):

python -m venv env
env\Scripts\activate     # For Windows


3. Install dependencies:

pip install fastapi uvicorn SQLAlchemy pymysql python-dotenv

4. Set up MySQL Database:
   
5. Configure .env file:
   
6.Run the FastAPI server:

uvicorn main:app --reload


** Frontend Setup (Next.js):**

1. Install frontend dependencies:

npm install
