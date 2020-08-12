import React from "react";
import ReactDOM from "react-dom";
import {signup, logout, login} from './util/session_api_util'

document.addEventListener("DOMContentLoaded", () => {
    window.signup = signup;
    window.logout = logout;
    window.login = login; 

    const root = document.getElementById("root");
    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});


// const user = { user: 
//     {username: "anya", 
//     password: "mandatoryfun"} 
// }
