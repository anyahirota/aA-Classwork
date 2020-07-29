console.log("Webpack is working!")

const Game = require("./game.js");
window.Game = Game;

const GameView = require("./game_view.js");
window.GameView = GameView;


// document.addEventListener('DOMContentLoaded', (event) => {
//     const canvas = document.getElementById("game-canvas");
//     const ctx = canvas.getContext('2d');
// });

document.addEventListener('DOMContentLoaded', function() {
    const canvas = document.getElementById("game-canvas");
    canvas.width = Game.DIM_X;
    canvas.height = Game.DIM_Y;
    const ctx = canvas.getContext('2d');

    const game1 = new Game();
    const g = new GameView(game1, ctx);
    g.start();
});

