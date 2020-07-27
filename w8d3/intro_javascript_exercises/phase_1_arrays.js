Array.prototype.uniq = function() {
    let ourArr = [];
    for (let i = 0; i < this.length; i++) {
        if (ourArr.includes(this[i])) {
            continue;
        } else {
            ourArr.push(this[i]);
        };
    };
    return ourArr;
};
console.log([1, 2, 2, 3, 3, 3].uniq())



Array.prototype.twoSum = function() {
    let ourArr = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this.length; j++) {
            if ((this[i] + this[j] === 0) && (j > i)) {
                ourArr.push([i,j]);
            };
        };
    };
    return ourArr;
};
console.log([1, 4, -5, 0, 5, 2, 3].twoSum())



Array.prototype.transpose = function() {
    
    let ourArr = new Array(this[0].length);
    for (let i = 0; i < ourArr.length; i++) {
        ourArr[i] = new Array(this.length); 
    }
    
    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this[0].length; j++) {

            ourArr[i][j] = this[j][i];
        };
    };
    return ourArr;
};
console.log([[1, 2], [3, 4]].transpose())