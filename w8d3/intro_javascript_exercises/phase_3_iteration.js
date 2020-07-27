Array.prototype.bubbleSort = function() {
    let arr = this.slice(0);

    let sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 0; i < arr.length-1; i++) {
            if (arr[i] > arr[i+1]) {
                // let temp = arr[i];
                // arr[i] = arr[i+1];
                // arr[i+1] = temp;
                [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
                sorted = false;
            }
        }
    }
    return arr;
};

String.prototype.substrings = function() {
    let subs = [];

    for (let i = 0; i < this.length; i++) {
        for (let j = i; j < this.length; j++) {
            subs.push(this.slice(i, j+1));
        }
    }
    return subs;
}

