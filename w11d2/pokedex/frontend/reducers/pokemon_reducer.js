import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions'; 

export const pokemonReducer = (oldState = {}, action) => {
    let newState;  
    switch(action.type) {
        case RECEIVE_ALL_POKEMON:
            newState = {...oldState, ...action.pokemon};  
            return newState;
        case RECEIVE_ONE_POKEMON:
            newState = Object.assign(oldState);
            
            newState[action.onePokemon.pokemon.id] = action.onePokemon.pokemon; 
            return newState; 
        default:
            return oldState; 
    }
}

export const itemsReducer = (oldState = {}, action) => {
  let newState;
  switch(action.type) {
    case RECEIVE_ONE_POKEMON:
      return action.onePokemon.items;
    default:
      return oldState
  }
}

