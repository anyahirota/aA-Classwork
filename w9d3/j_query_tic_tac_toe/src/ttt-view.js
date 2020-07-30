const POSITIONS = {
  "cell-0": [0, 0],
  "cell-1": [0, 1],
  "cell-2": [0, 2],
  "cell-3": [1, 0],
  "cell-4": [1, 1],
  "cell-5": [1, 2],
  "cell-6": [2, 0],
  "cell-7": [2, 1],
  "cell-8": [2, 2]
}

class View {

  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
  }

  bindEvents() {
    $("ul").on("click", event => {
      const $eventTarget = $(event.target).attr("id");
      const id = $eventTarget.toString();
      // console.log(id);
      // console.log(POSITIONS[id]);
      if (this.game.board.isEmptyPos(POSITIONS[id])) {
        // debugger
        this.game.playMove(POSITIONS[id]);
        // debugger
        this.makeMove($eventTarget);
        if (this.game.isOver()) {
          // debugger
          const $winningEl = $(`p:contains(${this.game.winner()})`).parent();
          $winningEl.css("background-color", "green");
          alert(`You Win, ${this.game.winner()}!!!`);
        }
      } else {
        alert("move is invalid, fool");
      }
    });
  }

  makeMove($square) {
    $(`#${$square}`).css("background-color", "white");
    $(`#${$square}`).html(`<p>${this.game.currentPlayer}</p>`)
    if (this.game.currentPlayer === "x") {
      $(`#${$square}`).css("color", "blue");
    } else {
      $(`#${$square}`).css("color", "red");
    }
  }

  setupBoard() {
    let board = $(".ttt").append("<ul class='board'></ul>");
    for (let j = 0; j < 9; j++) {
      let cell = $(".board").append(`<li id="cell-${j}"></li>`);
    }
  }
}

module.exports = View;
