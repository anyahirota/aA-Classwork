

const thunk = (store) => (next) => (action) => {
  if (typeof action === 'function') {
    return action(store.dispatch);
  }
  return next(action);
}


export default thunk;

// const thunk = ({ dispatch, getState }) => next => action => {
//   if (typeof action === "function") {
//     return action(dispatch, getState);
//   }
//   return next(action);
// }

// export default thunk;