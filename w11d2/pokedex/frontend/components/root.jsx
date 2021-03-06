import React from 'react'; 
import {Provider} from 'react-redux'; 
import PokemonIndexContainer from './pokemon/pokemon_index_container'; 
import { HashRouter, Route } from "react-router-dom";
import PokemonDetailsContainer from './pokemon/pokemon_detail_container'



const Root = ({store}) => (
    <Provider store={store}>
        <HashRouter>
          <Route path="/" component={PokemonIndexContainer} />
          <Route path="/pokemon/:pokemonId" component={PokemonDetailsContainer} />
        </HashRouter>
    </Provider>
); 

export default Root; 