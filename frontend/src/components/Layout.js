import Navbar from "./Navbar";
import { useRouter } from 'next/router'; 

const Layout = ({ children }) => {
  const router = useRouter();
  const isSignInPage = router.pathname === "/signin";  

  return (
    <div>
      <Navbar />
      <div
        style={{
          opacity: isSignInPage ? 0.3 : 1,  
          transition: 'opacity 0.3s ease', 
        }}
      >
        {children}  
      </div>
    </div>
  );
};

export default Layout;
