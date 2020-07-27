Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }

} 


Array.prototype.myMap = function(callback) {
    let newArr = [];

    let callbackForEach = function(ele) {
        newArr.push(callback(ele));
    };

    this.myEach(callbackForEach); 
    return newArr;

}


Array.prototype.myReduce = function(callback, initialValue) {
    let accumulator; 
    let arr;
    if (initialValue === undefined) {
        accumulator = initialValue;
        arr = this;
    } else {
        accumulator = this[0];
        arr = this.slice(1);
    }

    arr.myEach(el => accumulator = callback(accumulator, el));

    return accumulator;
}

// Array#myInject
// Array.prototype.myReduce = function (func, initialValue) {

//     let arr = this;

//     if (initialValue === undefined) {
//         initialValue = arr[0];
//         arr = arr.slice(1);
//     }

//     let result = initialValue;

//     arr.myEach(el => result = func(result, el));

//     return result;
// };

// console.log(NUMS.myReduce((total, item) => total + item));


