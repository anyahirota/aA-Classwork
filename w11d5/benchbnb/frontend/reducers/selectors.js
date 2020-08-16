export const selectAllBenches = (state) => {
    const benches = Object.values(state.entities.benches);
    return benches;
};