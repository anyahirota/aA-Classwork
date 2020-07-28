//  --------------------------- Sum ---------------------------
 
function sum() {
    let arg = Array.from(arguments);
    let total = 0;
    for (let i = 0; i < arg.length; i++) {
        total += arg[i];
    }
    return total; 
}

function sum2(...arrayOfArgs) {
    let total = 0;
    for (let i = 0; i < arrayOfArgs.length; i++) {
      total += arrayOfArgs[i];
    }
    return total;
}

// ---------------------------  Bind with args ---------------------------

Function.prototype.myBind = function () {
  // context arg
  const contextArg = arguments[0];
  const bindArgs = Array.from(arguments).slice(1);
  const that = this;

  return function() {
    // bound args
    const callArgs = Array.from(arguments);
    return that.apply(contextArg, bindArgs.concat(callArgs));
  }

}


Function.prototype.myBind = function (context, ...bindArgs) {
    return (...callArgs) => {
      return this.apply(context, bindArgs.concat(callArgs))
    };
}

// --------------------------- Curried Sum ---------------------------

function curriedSum(numArgs) {
    const numbers = [];

    function _curriedSum(number) {
      console.log(numbers)
        numbers.push(number);
        if (numbers.length === numArgs) {
          console.log(numbers)
            let sum = 0;
            for (let i = 0; i < numbers.length; i++) {
                sum += numbers[i];
            }
            return sum;
        } else {
            return _curriedSum;
        }
    }
    return _curriedSum;
}

// --------------------------- Using apply ---------------------------

Function.prototype.curriedSum = function(numArgs) {
  const numbers = [];
  const that = this;

  function _curriedSum(num) {
    // console.log(numbers);
    numbers.push(num);
    if (numbers.length === numArgs) {
      // console.log(numbers);
      return that.apply(null, numbers);
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

// --------------------------- Spread operator ---------------------------

Function.prototype.curriedSum = function(numArgs) {
    const numbers = [];

    const _curriedSum = (num) => {
        numbers.push(num);
        if (numArgs === numbers.length) {
            return this(...numbers);
        } else {
            return _curriedSum;
        }
    }
    return _curriedSum;
}

// const sum = function(){
//   let total = 0;
//   for (let i = 0; i < arguments.length; i++) {
//     total += arguments[i];
//   }
//   return total;
// }
// console.log(sum.curriedSum(4)(5)(30)(20)(1));

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply
