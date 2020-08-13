import { connect } from 'react-redux';
import { signup } from '../../actions/session_actions';
import { Link } from 'react-router-dom';
import SessionForm from './session_form';
import React from 'react';

const mapStateToProps = (state, ownProps) => {
    return {
        errors: state.errors.session,
        formType: 'signup',
        formHeader: 'Sign Up!',
        formFooter: "Already have an account?",
        navLink: <Link to="/login">Login instead!</Link>
    };
};

const mapDispatchToProps = dispatch => ({
    processForm: (user) => dispatch(signup(user)),
});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(SessionForm); 
