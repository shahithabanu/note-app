import { useState } from "react";
import { useRouter } from "next/router";
import { api } from "../services/api";
import styles from "../styles/SignIn.module.css";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

export default function SignIn() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const router = useRouter();

  // SignIn Component
  const handleSubmit = async (e) => {
    e.preventDefault();
  
    if (!email.trim() || !password.trim()) {
      toast.error("All fields are required.", {
        position: "top-right",
        autoClose: 3000,
      });
      return;
    }
  
    try {
      const response = await api.post("/signin", { user_email: email, password });
  
      if (response.data.success) {
        // Store user ID after successful login
        const userId = localStorage.setItem("user_id", response.data.user_id);
        console.log("signup-userid>>>" , userId);
        toast.success("Sign-in successful! Redirecting to home...", {
          position: "top-right",
          autoClose: 3000,
        });
  
        setTimeout(() => {
          router.push("/");
        }, 3000);
      }
    } catch (error) {
      console.log("🔴 Backend Error Response:", error.response?.data);
  
      const errorMessage = error.response?.data?.detail || "Invalid credentials. Please try again.";
      toast.error(errorMessage);
    }
  };
  

  return (
    <div className={styles.container}>
      <div className={styles.formContainer}>
        <h2 className={styles.heading}>Sign In</h2>
        <ToastContainer />

        <form onSubmit={handleSubmit}>
          <input
            type="text"
            placeholder="Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className={styles.inputField}
          />
          <input
            type="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className={styles.inputField}
          />
          <button className={styles.submitButton} type="submit"
         
          >
            Sign In
          </button>
        </form>
        <button
          onClick={() => router.push("/signup")}
          className={styles.registerButton}
        >
          Don't have an account? Register
        </button>
      </div>
    </div>
  );
}
