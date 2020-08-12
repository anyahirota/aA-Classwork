

export const fetchAllPokemon = () => {
  return $.ajax({
    url: '/api/pokemon',
    method: 'GET'
  })
};


export const fetchOnePokemon = (id) => {
  return $.ajax({
    url: `/api/pokemon/${id}`,
    method: "GET",
  });
};

