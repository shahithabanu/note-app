import axios from "axios";
import Cookies from "js-cookie";

const API_URL = "http://localhost:8000";

export const api = axios.create({
  baseURL: API_URL,
  headers: {
    "Content-Type": "application/json",
  },
});
// Add token to every request
api.interceptors.request.use((config) => {
  const token = Cookies.get("token");
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});
export { api };

// Example API calls
export const fetchNotes = () => api.get("/notes");
export const createNote = (note) => api.post("/notes", note);
export const updateNote = (id, note) => api.put(`/notes/${id}`, note);
export const deleteNote = (id) => api.delete(`/notes/${id}`);
