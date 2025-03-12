import "../styles/globals.css";
import Navbar from "../components/Navbar";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

function MyApp({ Component, pageProps }) {
  return (
    <>
      <Navbar /> 
      <ToastContainer />
      <Component {...pageProps} />
    </>
  );
}

export default MyApp;
