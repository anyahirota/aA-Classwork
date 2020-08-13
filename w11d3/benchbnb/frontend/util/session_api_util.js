

export const signup = (user) => (
    $.ajax({
        url: '/api/users',
        method: 'POST',
        data: {user},
    })
)

// export function logout() {
//     return (
//         $.ajax({
//             url: '/api/session',
//             method: 'DELETE',
//         })
//     )
// }

export const logout = () => (
    $.ajax({
        url: '/api/session',
        method: 'DELETE',
    })
);

export const login = (user) => {
  
    return $.ajax({
        url: '/api/session',
        method: 'POST', 
        data: {user},
    })
}


// export const fetchAllPokemon = () => (
//     $.ajax({
//         method: 'GET',
//         url: 'api/pokemon'
//     })
// );

// export const fetchSinglePokemon = id => (
//     $.ajax({
//         method: 'GET',
//         url: `api/pokemon/${id}`
//     })
// );