

export const selectAllPokemon = (state) => {
   const pokes = Object.values(state.entities.pokemon);
  return pokes;  
};

export const selectItems = (state) => {
  const items = Object.values(state.entities.items);
  return items
}