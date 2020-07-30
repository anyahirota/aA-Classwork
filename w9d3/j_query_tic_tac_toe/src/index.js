const View = require("./ttt-view.js")
const Game = require("./game.js")

$(() => {
  const $ttt = $(".ttt")
  const game = new Game();
  const view = new View(game, $ttt);
  view.setupBoard();
  view.bindEvents();
});