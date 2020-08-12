import React from 'react'
import { Link } from 'react-router-dom'


export default function pokemon_index_item({poke}) {
  return (
    <li>
      <Link to={`/pokemon/${poke.id}`}>
        <img src={poke.image_url} alt="poke" />
        {poke.name}
      </Link>
    </li>
  );
}

