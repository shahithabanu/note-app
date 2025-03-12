import { useEffect, useState } from "react";
import { useRouter } from "next/router";
import dynamic from "next/dynamic";
import { toast, ToastContainer } from "react-toastify";
import axios from "axios";
import styles from "../styles/Home.module.css";
import "react-toastify/dist/ReactToastify.css";

// Dynamically import Quill with SSR disabled
const ReactQuill = dynamic(() => import("react-quill"), { ssr: false });
import "react-quill/dist/quill.snow.css";

export default function Home() {
  const [notes, setNotes] = useState([]);
  const [noteId, setNoteId] = useState(null);
  const [noteTitle, setNoteTitle] = useState("");
  const [noteContent, setNoteContent] = useState("");
  const [isAddingNote, setIsAddingNote] = useState(false);

  const router = useRouter();

  useEffect(() => {
    const userId = localStorage.getItem("user_id");
    console.log("etuser", userId);
    if (!userId) {
      router.push("/signin");
    } else {
      fetchNotes(userId);
    }
  }, []);

  const fetchNotes = async (userId) => {
    try {
      const response = await axios.get(`http://localhost:8000/notes/${userId}`);
      if (response.data.length === 0) {
        setNotes([]);
      } else {
        setNotes(response.data);
      }
    } catch (error) {

      console.error("Error fetching notes:", error.response?.data);
      if (error.response?.status !== 404) {
        toast.error(error.response?.data?.detail || "Error fetching notes.");
      } else {
        setNotes([]);
      }

    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!noteTitle || !noteContent) {
      toast.error("Title and content are required!");
      return;
    }

    const userId = localStorage.getItem("user_id");
    if (!userId) {
      toast.error("User not authenticated!");
      return;
    }

    try {
      let successMessage;
      if (noteId) {
        const response = await axios.put(`http://localhost:8000/notes/${noteId}`, {
          note_title: noteTitle,
          note_content: noteContent,
          user_id: userId,
        });
        successMessage = response.data.message || "Note updated successfully!";
      } else {
        const response = await axios.post("http://localhost:8000/notes/", {
          note_title: noteTitle,
          note_content: noteContent,
          user_id: userId,
        });
        successMessage = response.data.message || "Note added successfully!";
      }

      toast.success(successMessage);
      fetchNotes(userId);
      setIsAddingNote(false);
      resetForm();
    } catch (error) {
      console.error("Error saving note:", error.response?.data);
      toast.error("Failed to save note.");
    }
  };

  const handleEdit = (note) => {
    setNoteId(note.note_id);
    setNoteTitle(note.note_title);
    setNoteContent(note.note_content);
    setIsAddingNote(true);
  };

  const handleDelete = async (id) => {
    if (confirm("Are you sure you want to delete this note?")) {
      try {
        const response = await axios.delete(`http://localhost:8000/notes/${id}`);
        toast.success(response.data.message || "Note deleted successfully!");

        // Update the state  without refreshing
        setNotes((prevNotes) => prevNotes.filter((note) => note.note_id !== id));
      } catch (error) {
        console.error("Error deleting note:", error.response?.data);
        toast.error(error.response?.data?.detail || "Failed to delete note.");
      }
    }
  };



  const handleAddNoteClick = () => {
    setIsAddingNote(true);
    resetForm();
  };

  const resetForm = () => {
    setNoteId(null);
    setNoteTitle("");
    setNoteContent("");
  };

  return (
    <>
      <ToastContainer />
      <div className={styles.container}>
        <h1 className={styles.heading}>Your Notes</h1>

        <button onClick={handleAddNoteClick} className={styles.addNoteButton}>
          +
        </button>

        {isAddingNote && (
          <div className={styles.addNoteForm}>
            <h2>{noteId ? "Edit Note" : "Create Note"}</h2>
            <form onSubmit={handleSubmit}>
              <input
                type="text"
                placeholder="Note Title"
                value={noteTitle}
                onChange={(e) => setNoteTitle(e.target.value)}
                className={styles.input}
              />
              <ReactQuill
                value={noteContent}
                onChange={setNoteContent}
                className={styles.quillEditor}
              />
              <button type="submit" className={styles.btn}>
                {noteId ? "Update Note" : "Create Note"}
              </button>
              <button
                type="button"
                onClick={() => setIsAddingNote(false)}
                className={styles.cancel}
              >
                Cancel
              </button>
            </form>
          </div>
        )}

        <div className={styles.notesList}>
          {notes.length === 0 ? (
            <p className={styles.noNotesMessage}>No notes available. Start by creating one!</p>
          ) : (
            notes.map((note) => (
              <div key={note.note_id} className={styles.noteCard}>
                <h3>{note.note_title}</h3>
                <div dangerouslySetInnerHTML={{ __html: note.note_content }} />
                <div className={styles.actions}>
                  <button onClick={() => handleEdit(note)} className={styles.btnEdit}>Edit</button>
                  <button onClick={() => handleDelete(note.note_id)} className={styles.btnDelete}>Delete</button>
                </div>
              </div>
            ))
          )}
        </div>

      </div>
    </>
  );
}
