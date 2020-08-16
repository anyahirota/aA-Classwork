import React from "react";
import GreetingContainer from "./greeting/greeting_container";
import LoginFormContainer from "./login_signup/login_form_container"; 
import SignupFormContainer from "./login_signup/signup_form_container"; 
import BenchIndexContainer from "./bench/bench_index_container"; 
import {
    Route,
    Redirect,
    Switch,
    Link,
    HashRouter
} from 'react-router-dom';
import {AuthRoute, ProtectedRoute} from "../util/route_util"; 

const App = () => (
    <div>
        <header>
            <h1>Bench BnB</h1>
            <GreetingContainer />
        </header>

        <AuthRoute path="/login" component={LoginFormContainer} />
        <AuthRoute path="/signup" component={SignupFormContainer} />
        <Route exact path="/" component={BenchIndexContainer} />
    </div>
);

export default App;