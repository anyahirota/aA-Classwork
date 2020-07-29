const Util = require("./util.js");
const MovingObject = require("./moving_object.js")

const DEFAULTS = {
    COLOR: "#283e3e",
    RADIUS: 25
};

function Asteroid(options) {
    options.pos = options.pos,
    options.color = DEFAULTS.COLOR,
    options.vel = Util.randomVec(1),
    options.radius = DEFAULTS.RADIUS
    MovingObject.call(this, options );
}

Util.inherits(Asteroid, MovingObject);



module.exports = Asteroid;