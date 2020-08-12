import { connect } from 'react-redux'; 
import { createNewUser } from '../../actions/session'; 
import Signup from './signup'; 

const mapDispatchToProps = dispatch => ({
    createNewUser: formUser => dispatch(createNewUser(formUser))
}); 

export default connect(null, mapDispatchToProps)(Signup); 

//dont need mapStateToProps becaus signup does not rely on any slice of state