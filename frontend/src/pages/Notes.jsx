import { useEffect, useState } from "react";
import { api } from "../services/api";
import styles from "./Home.module.css";

export default function Home() {
  const [notes, setNotes] = useState([]);
  const [error, setError] = useState("");

  useEffect(() => {
    const fetchNotes = async () => {
      const token = localStorage.getItem("token");
      const user_id = localStorage.getItem("user_id");

      if (!token || !user_id) {
        setError("Unauthorized. Please sign in.");
        return;
      }

      try {
        const response = await api.get(`/notes/${user_id}`, {
          headers: { Authorization: `Bearer ${token}` },
        });

        setNotes(response.data);
      } catch (error) {
        console.log("🔴 Error fetching notes:", error.response?.data);
        setError("Failed to load notes. Please try again.");
      }
    };

    fetchNotes();
  }, []);

  return (
    <div className={styles.container}>
      <h1 className={styles.heading}>Your Notes</h1>
      {error && <p className={styles.error}>{error}</p>}
      {notes.length > 0 ? (
        <div className={styles.notesList}>
          {notes.map((note) => (
            <div key={note.note_id} className={styles.noteCard}>
              <h3 className={styles.noteTitle}>{note.note_title}</h3>
              <p className={styles.noteContent}>{note.note_content}</p>
            </div>
          ))}
        </div>
      ) : (
        <p>No notes found.</p>
      )}
    </div>
  );
}
