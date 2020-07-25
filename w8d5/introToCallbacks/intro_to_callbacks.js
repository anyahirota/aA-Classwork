const readline = require('readline');

class Clock {
  constructor() {
    // 1. Create a Date object.
    const date = new Date(); 

    // 2. Store the hours, minutes, and seconds.
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();

    // 3. Call printTime.
    this.printTime();

    // 4. Schedule the tick at 1 second intervals.
    setInterval(() => {
        this._tick();
    }, 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    const time = [];
    if (this.hours < 10) {
      time.push(`0${this.hours}`);
    } else {
      time.push(`${this.hours}`);
    }

    if (this.minutes < 10) {
      time.push(`0${this.minutes}`);
    } else {
      time.push(`${this.minutes}`);
    }

    if (this.seconds < 10) {
      time.push(`0${this.seconds}`);
    } else {
      time.push(`${this.seconds}`);
    }
    // Use console.log to print it.
    console.log(time.join(":"));
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.seconds += 1;
    this.printTime();
  }
}

// const clock = new Clock();
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if(numsLeft === 0) {
    completionCallback(sum);
    reader.close();
  } else {
    reader.question("Type in a number: ", function(number) {
    const inputNum = parseInt(number);
    const newSum = sum + inputNum;
    console.log(newSum);
    addNumbers(newSum, numsLeft - 1, completionCallback);
    }); 
  }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));