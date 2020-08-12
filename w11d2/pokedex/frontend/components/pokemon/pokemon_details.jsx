import React, { useEffect } from 'react'

export default class PokemonDetails extends React.Component {
  constructor(props) {
    super(props)
    this.items = this.props.items 
    this.requestOnePokemon = this.requestOnePokemon.bind(this)
    this.moves = pokemon.moves.map((move, idx) => (
    <li key={idx}>{move}</li>
    )); 
    this.itemsList = items.map((item, idx) => (
    <li key={idx}>{item.name}</li>
    ));
  }
  
 

    componentDidMount() {
      requestOnePokemon(this.props.match.params.pokemonId); 
    }
    render() {
      return (
        <div>
          <h3>{pokemon.name}</h3>
          <ul>
            <li>{pokemon.type}</li>
            <li>{pokemon.attack}</li>
            <li>{pokemon.defense}</li>
            {moves}
            {itemsList}
          </ul>
        </div>
      );
          }
  
}

