import React from 'react'; 
import { Link } from 'react-router-dom';

const Greeting = ({currentUser, logout}) => {
    const sessionLinks = () => (
        <nav className="login-signup">
            <Link to="/login">Login</Link>
            <br/>
            <Link to="/signup">Sign up</Link>
        </nav>
    ); 

    const loggedInGreeting = () => (
        <div className="greeting-header">
            <h2 className="header-user-name">Hi, {currentUser.username}</h2>
            <button className="header-button" onClick={logout}>Log Out</button>
        </div>
    );

    return currentUser ? loggedInGreeting() : sessionLinks(); 
}

export default Greeting; 