import React from 'react';
import Board from './board';
import * as Minesweeper from './minesweeper.js'; 


export default class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board(10, 5), 
    }

    this.updateGame = this.updateGame.bind(this);
    this.restart = this.restart.bind(this);
  }

  updateGame(tile, flagging) {
    if (flagging) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }

    this.setState({ board: this.state.board })
  }

  restart(e) {
    e.preventDefault(); 
    this.setState({ board: new Minesweeper.Board(10, 5)});
  }

  render() {
    let text, klass, klass2;
    let klass3 = "hidden";
    
    if (this.state.board.won()) {
      text = "You've won.";
      klass = "modal-screen";
      klass2 = "modal-form";
      klass3 = "button";
    } else if (this.state.board.lost()) {
      text = "You've lost.";
      klass = "modal-screen";
      klass2 = "modal-form";
      klass3 = "button";
    }
    return (
      <div>
        <Board board={this.state.board} updateGame={this.updateGame}/>
          <section className={klass}></section>
          <form className={klass2}>
            {text}
            <button className={klass3} onClick={this.restart}>Play Again</button>
          </form>
      </div>
    )
  }

}


