import React from 'react'; 
class Clock extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
          time: new Date()
        }
    } 

    componentDidMount() {
        this.handle = setInterval(() => {this.tick()}, 1000);
    }

    tick() {
        this.setState({time: new Date()}); 
    }

    componentWillUnmount() {
        clearInterval(this.handle);
    }

    render() {
        return (
            <div className="clock">
                <h1>Clock</h1> 
                <ul className="time-and-date"> 
                    <li> 
                        <ul className="time">
                            <li>Time: </li>
                            <li>{this.state.time.toLocaleTimeString('en-US')}</li>
                        </ul>
                    </li>
                    <li> 
                        <ul className="date">
                            <li>Date: </li>
                            <li>{this.state.time.toLocaleDateString(undefined, { weekday: 'short', month: 'short', day: 'numeric', year: 'numeric' })}</li>
                        </ul>
                    </li>
                </ul>
            </div>

        );
    }

}; 

export default Clock;

// setInterval(function(){ 
// console.log("Oooo Yeaaa!");
// }, 2000);