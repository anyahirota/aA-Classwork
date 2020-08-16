import {connect} from 'react-redux'; 
import {login} from '../../actions/session_actions'; 
import { Link } from 'react-router-dom';
import SessionForm from './session_form'; 
import React from 'react';


const mapStateToProps = (state, ownProps) => {
    return {
       errors: state.errors.session,
       formType: 'login', 
        formHeader: 'Log in!',
        formFooter: "Don't have an account?",
       navLink: <Link to="/signup">Sign up instead.</Link>
    };
};

const mapDispatchToProps = dispatch => {
    return {
    processForm: (user) => dispatch(login(user)),
}};

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(SessionForm); 
