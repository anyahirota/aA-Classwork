import {RECEIVE_CURRENT_USER} from "../actions/session_actions"

export default (oldState = {}, action) => {
    Object.freeze(oldState); 
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
           let newState = Object.assign({}, oldState, { [action.user.id]: action.user });
            return newState; 
        default:
            return oldState;
    }
}