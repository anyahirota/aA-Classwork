const Util = require("./util.js");
const Asteroid = require("./asteroid.js");

function Game() {
    this.asteroids = [];
    this.addAsteroids();
}

Game.DIM_X = 500; 
Game.DIM_Y = 500; 
Game.NUM_ASTEROIDS = 25;

Game.prototype.addAsteroids = function() {
// addAsteroids => create asteroids => add them to array
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
        const randPosition = this.randomPosition();
        const newAst = new Asteroid({pos: randPosition, game: this})
        this.asteroids.push(newAst);
    }
}

Game.prototype.randomPosition = function() {
    // create random positions 
    let random_x = Math.floor(Math.random() * Game.DIM_X);
    let random_y = Math.floor(Math.random() * Game.DIM_Y);
    return [random_x, random_y];
}

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
    this.asteroids.forEach(function (asteroid) {
        asteroid.draw(ctx);
    })
}

Game.prototype.moveObjects = function() {
    this.asteroids.forEach(function (asteroid) {
        asteroid.move();
    })
}

Game.prototype.wrap = function(pos, radius) {
    let wrapped_x;
    let wrapped_y;
    if ((pos[0] - radius) > Game.DIM_X) {
        wrapped_x = pos[0] % Game.DIM_X;
    } else if ((pos[0] + radius) < 0) {
        wrapped_x = Game.DIM_X - (pos[0] % Game.DIM_X);
    } else {
        wrapped_x = pos[0];
    };

    if ((pos[1] - radius) > Game.DIM_Y) {
        wrapped_y = pos[1] % Game.DIM_Y;
    } else if ((pos[1] + radius) < 0) {
        wrapped_y = Game.DIM_Y - (pos[1] % Game.DIM_Y);
    } else {
        wrapped_y = pos[1];
    };

    return [wrapped_x, wrapped_y];
}

Game.prototype.checkCollisions = function () {
    for (let i = 0; i < this.asteroids.length; i++){
        for (let j = i + 1; j < this.asteroids.length; j++) {
            if (this.asteroids[i].isCollidedWith(this.asteroids[j])) {
                // alert("COLLISION"); 
                // // debugger
                // this.asteroids[i].collideWith(this.asteroids[j]);
            }
        }
    }

}

Game.prototype.step = function () {
    this.moveObjects();
    this.checkCollisions();
}

Game.prototype.remove = function (asteroid) {
    this.asteroids.splice(this.asteroids.indexOf(asteroid), 1);
}

module.exports = Game;