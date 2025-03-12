import { useState } from "react";
import { useRouter } from "next/router";
import { api } from "../services/api";
import styles from '../styles/SignUp.module.css';
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

export default function SignUp() {
  const [user_name, setName] = useState("");
  const [user_email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState({});
  const router = useRouter();

  // Form validation
  const validateForm = () => {
    let newErrors = {};

    if (!user_name.trim()) {
      newErrors.user_name = "Name is required";
    } else if (user_name.length < 3) {
      newErrors.user_name = "Name must be at least 3 characters";
    }

    if (!user_email.trim()) {
      newErrors.user_email = "Email is required";
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(user_email)) {
      newErrors.user_email = "Invalid email format";
    }

    if (!password) {
      newErrors.password = "Password is required";
    } else if (password.length < 6) {
      newErrors.password = "Password must be at least 6 characters";
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  // Handle signup
  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!validateForm()) return;

    try {
      await api.post("/signup", {
        user_name,
        user_email,
        password,
      });

      toast.success("Signup successful! Redirecting to login...", {
        position: "top-right",
        autoClose: 3000,
      });

      // Redirect to sign-in page after success
      setTimeout(() => {
        router.push("/signin");
      }, 3000);
    } catch (error) {
      console.error("Signup failed:", error.response?.data);
      toast.error(error.response?.data?.detail || "Signup failed. Please try again.", {
        position: "top-right",
        autoClose: 3000,
      });
    }
  };

  return (
    <div className={styles.container}>
      <div className={styles.formContainer}>
        <h2 className={styles.heading}>Sign Up</h2>

        <ToastContainer />
        <form onSubmit={handleSubmit}>
          <input
            type="text"
            placeholder="Name"
            value={user_name}
            onChange={(e) => setName(e.target.value)}
            className={styles.inputField}
          />
          {errors.user_name && <p className={styles.errorText}>{errors.user_name}</p>}

          <input
            type="email"
            placeholder="Email"
            value={user_email}
            onChange={(e) => setEmail(e.target.value)}
            className={styles.inputField}
          />
          {errors.user_email && <p className={styles.errorText}>{errors.user_email}</p>}

          <input
            type="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className={styles.inputField}
          />
          {errors.password && <p className={styles.errorText}>{errors.password}</p>}

          <button className={styles.submitButton} type="submit">
            Sign Up
          </button>
        </form>

        <button onClick={() => router.push("/signin")} className={styles.loginButton}>
          Already have an account? Login
        </button>
      </div>
    </div>
  );
}
