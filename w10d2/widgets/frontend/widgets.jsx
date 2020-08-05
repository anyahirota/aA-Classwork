import React from 'react'; 
import Clock from './clock'; 
import Tabs from './tabs'; 
class Widgets extends React.Component {
    render() {
        const arr = [{ title: "one", content: "I am first" }, { title: "two", content: "Second pane here" }, { title: "three", content: "Third pane here" }];
        return (
            <div>
                <Clock />
                <br />
                <br />
                <Tabs arr={arr} />
            </div>
        );
    }

};

export default Widgets;