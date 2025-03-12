import { useEffect, useState } from "react";
import { useRouter } from "next/router";
import styles from "../styles/Navbar.module.css";

export default function Navbar() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const router = useRouter();

  // Check if user is logged in 
  useEffect(() => {
    const userId = localStorage.getItem("user_id");
    setIsAuthenticated(!!userId); 
  }, [router.pathname]); 

  // Handle logout with confirmation
  const handleLogout = () => {
    if (window.confirm("Are you sure you want to log out?")) {
      localStorage.removeItem("user_id"); 
      setIsAuthenticated(false);
      router.push("/signin"); 
    }
  };

  return (
    <nav className={styles.navbar}>
      <h1 className={styles.logo}>My Notes App</h1>
      <div className={styles.navLinks}>
        {isAuthenticated ? (
          <button className={styles.logoutButton} onClick={handleLogout}>
            Logout
          </button>
        ) : (
          <>
            <button
              className={styles.navButton}
              onClick={() => router.push("/signin")}
            >
              Sign In
            </button>
            <button
              className={styles.navButton}
              onClick={() => router.push("/signup")}
            >
              Sign Up
            </button>
          </>
        )}
      </div>
    </nav>
  );
}
