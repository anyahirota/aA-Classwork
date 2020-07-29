/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\n\nconst DEFAULTS = {\n    COLOR: \"#283e3e\",\n    RADIUS: 25\n};\n\nfunction Asteroid(options) {\n    options.pos = options.pos,\n    options.color = DEFAULTS.COLOR,\n    options.vel = Util.randomVec(1),\n    options.radius = DEFAULTS.RADIUS\n    MovingObject.call(this, options );\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\n\nfunction Game() {\n    this.asteroids = [];\n    this.addAsteroids();\n}\n\nGame.DIM_X = 500; \nGame.DIM_Y = 500; \nGame.NUM_ASTEROIDS = 25;\n\nGame.prototype.addAsteroids = function() {\n// addAsteroids => create asteroids => add them to array\n    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n        const randPosition = this.randomPosition();\n        const newAst = new Asteroid({pos: randPosition, game: this})\n        this.asteroids.push(newAst);\n    }\n}\n\nGame.prototype.randomPosition = function() {\n    // create random positions \n    let random_x = Math.floor(Math.random() * Game.DIM_X);\n    let random_y = Math.floor(Math.random() * Game.DIM_Y);\n    return [random_x, random_y];\n}\n\nGame.prototype.draw = function(ctx) {\n    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n    this.asteroids.forEach(function (asteroid) {\n        asteroid.draw(ctx);\n    })\n}\n\nGame.prototype.moveObjects = function() {\n    this.asteroids.forEach(function (asteroid) {\n        asteroid.move();\n    })\n}\n\nGame.prototype.wrap = function(pos, radius) {\n    let wrapped_x;\n    let wrapped_y;\n    if ((pos[0] - radius) > Game.DIM_X) {\n        wrapped_x = pos[0] % Game.DIM_X;\n    } else if ((pos[0] + radius) < 0) {\n        wrapped_x = Game.DIM_X - (pos[0] % Game.DIM_X);\n    } else {\n        wrapped_x = pos[0];\n    };\n\n    if ((pos[1] - radius) > Game.DIM_Y) {\n        wrapped_y = pos[1] % Game.DIM_Y;\n    } else if ((pos[1] + radius) < 0) {\n        wrapped_y = Game.DIM_Y - (pos[1] % Game.DIM_Y);\n    } else {\n        wrapped_y = pos[1];\n    };\n\n    return [wrapped_x, wrapped_y];\n}\n\nGame.prototype.checkCollisions = function () {\n    for (let i = 0; i < this.asteroids.length; i++){\n        for (let j = i + 1; j < this.asteroids.length; j++) {\n            if (this.asteroids[i].isCollidedWith(this.asteroids[j])) {\n                // alert(\"COLLISION\"); \n                // // debugger\n                // this.asteroids[i].collideWith(this.asteroids[j]);\n            }\n        }\n    }\n\n}\n\nGame.prototype.step = function () {\n    this.moveObjects();\n    this.checkCollisions();\n}\n\nGame.prototype.remove = function (asteroid) {\n    this.asteroids.splice(this.asteroids.indexOf(asteroid), 1);\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView (game, ctx) {\n    this.game = game;\n    this.ctx = ctx\n}\n\nGameView.prototype.start = function() {\n    const that = this;\n    setInterval( function() {\n        that.game.step();\n        that.game.draw(that.ctx);\n    }, 20\n    );\n}\n\nmodule.exports = GameView;\n\n// Uncaught TypeError: Cannot read property 'moveObjects' of undefined\n// at eval(game_view.js: 10)\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("console.log(\"Webpack is working!\")\n\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nwindow.Game = Game;\n\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\nwindow.GameView = GameView;\n\n\n// document.addEventListener('DOMContentLoaded', (event) => {\n//     const canvas = document.getElementById(\"game-canvas\");\n//     const ctx = canvas.getContext('2d');\n// });\n\ndocument.addEventListener('DOMContentLoaded', function() {\n    const canvas = document.getElementById(\"game-canvas\");\n    canvas.width = Game.DIM_X;\n    canvas.height = Game.DIM_Y;\n    const ctx = canvas.getContext('2d');\n\n    const game1 = new Game();\n    const g = new GameView(game1, ctx);\n    g.start();\n});\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("//key into options object using \".\"\n\nfunction MovingObject(options) {\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n    this.game = options.game;\n}\n\nMovingObject.prototype.draw = function(ctx) {\n    ctx.fillStyle = this.color;\n    ctx.beginPath();\n    ctx.arc(\n        this.pos[0],\n        this.pos[1],\n        this.radius, \n        0, \n        2 * Math.PI,\n        false\n    );\n    ctx.fill();\n}\n\nMovingObject.prototype.move = function () {\n    let new_x = this.pos[0] + this.vel[0];\n    let new_y = this.pos[1] + this.vel[1];\n    let new_pos = this.game.wrap([new_x, new_y] , this.radius);\n    this.pos = new_pos;\n}\n\nMovingObject.prototype.isCollidedWith = function (otherObject) {\n    const dist = Math.sqrt(Math.pow(this.pos[0] - otherObject.pos[0], 2) + Math.pow(this.pos[1] - otherObject.pos[1], 2));\n    if ((this.radius + otherObject.radius) >= dist) {\n        return true;\n    } else {\n        return false;\n    }\n}\n\nMovingObject.prototype.collideWith = function (otherObject) {\n        this.game.remove(this);\n        this.game.remove(otherObject);\n}\n\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        childClass.prototype = Object.create(parentClass.prototype);\n        childClass.prototype.constructor = childClass;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });