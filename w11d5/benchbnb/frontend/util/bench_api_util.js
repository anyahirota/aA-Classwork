export const fetchBenches = () => {
    return $.ajax({
        method: 'GET',
        url: '/api/benches',
        error: (err) => console.log(err)
    })
}

// $.ajax({
//     method: 'POST',
//     url: '/api/benches',
//     data: {
//         bench: {
//             description: "fun bench",
//             lat: 37.743565, lng: -122.452037
//         }
//     }
// }).then(
//     bench => console.log(bench),
// );