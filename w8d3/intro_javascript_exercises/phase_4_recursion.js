function range(start, end) {
    if (start === end) {return [];}
    newArr = range(start, end-1); 
    newArr.push(end-1);

    return newArr;
}

function sumRec(arr) {
    if (arr.length < 1) {return 0;}
    return sumRec(arr.slice(1)) + arr[0]; 
}

function exponent(base, exp) {
    if (exp === 1) {
        return base;
    }

    return exponent(base, exp-1) * base; 
}

// function exp1(base, exponent) {
//     return exponent === 0 ? 1 : (base * exp1(base, exponent - 1));
// }

function exp2(base, exponent) {
    if (exponent === 0) {
        return 1;
    }

    if (exponent % 2 === 0) {
        let subAnswer = exp2(base, exponent / 2);
        return subAnswer * subAnswer;
    } else {
        let subAnswer = exp2(base, ((exponent - 1) / 2));
        return subAnswer * subAnswer * base;
    }
}

function fibonacci(n) {
    if (n < 3) {
        return [1, 1];
    }

    let result = fibonacci(n-1);
    result.push(result[result.length-1] + result[result.length-2]);
    return result;
}

// function fibsRec(n) {
//     if (n < 3) {
//         return [0, 1].slice(0, n);
//     }

//     let fibs = fibsRec(n - 1);
//     fibs.push(fibs[fibs.length - 1] + fibs[fibs.length - 2]);

//     return fibs;
// }


function deepDup(arr) {
    // if (!(arr instanceof Array)) {
    //     return arr;
    // }

    // returningArr = [];

    // for (let i = 0; i < arr.length; i++) {
    //     debugger
    //     if (arr[i] instanceof Array) {
    //         returningArr.push(deepDup(arr[i]));
    //     } else {
    //         returningArr.push(arr[i]);
    //     }
    // }

    // return returningArr;

    if (!(arr instanceof Array)) {
        return arr;
    }
    return arr.map((el) => {
        return deepDup(el);
    });

}

deepDup([2, 3, [4, 5, [6]], 7])


