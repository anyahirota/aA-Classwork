// ----------------- Surrogate Solution ----------------

// const Surrogate = function () {}

// Function.prototype.inherits = function(superClass){
//     Surrogate.prototype = superClass.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// }

// ----------------- Object.create Solution ---------------- 

Function.prototype.inherits = function (superClass) {
  this.prototype = Object.create(superClass.prototype);
  this.prototype.constructor = this;
}

function Animal (name) {
  this.name = name;
}

Animal.prototype.eats = function() {
  console.log(`${this.name} says "mmm... delicious"`);
}

Animal.prototype.walks = function(){
  console.log(`${this.name} moves by ${this.move}!`)
}

function Dog (name, move) {
    Animal.call(this, name);
    this.move = move;
}
Dog.inherits(Animal);

function Cat (name, move) {
    Animal.call(this, name);
    this.move = move;
}
Cat.inherits(Animal);

const fido = new Dog('Fido', 'running');
const garfield = new Cat('Garfield', 'prowling')
// fido.eats();
// fido.walks();
garfield.walks();
