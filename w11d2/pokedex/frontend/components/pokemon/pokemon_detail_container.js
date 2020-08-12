import { connect } from 'react-redux'
import PokemonDetails from './pokemon_details'
import { selectItems } from '../../reducers/selectors'
const mapStateToProps = (state) => ({
  items: selectItems(state)
})

const mapDispatchToProps = (dispatch) => ({
  requestOnePokemon: (id) => dispatch(requestOnePokemon(id))
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetails)
