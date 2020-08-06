import React from 'react';
import Tile from './tile';
import * as Minesweeper from './minesweeper.js'; 


export default class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render()  {
    return (
      <div>
        {this.props.board.grid.map((row, i) => {
          return (
            <div className="rows" key={i}>
              {row.map((tile, j)=> {
                return <Tile key={j} tile={tile} updateGame={this.props.updateGame}/>
              })}
            </div>
          );
        })}
      </div>
    );
  }
}