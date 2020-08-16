import React from 'react'; 
import BenchIndexItem from './bench_index_item'


class BenchIndex extends React.Component {
    constructor(props) {
        super(props); 
    }

    componentDidMount() {
        // request benches from your API here
        this.props.fetchBenches(); 
    }

    render() {
        return (
            <ul className="benches-index">
                {this.props.benches.map((bench) => (
                    <BenchIndexItem key={bench.id} bench={bench} />
                ))}
            </ul>
        )
    }
}

export default BenchIndex; 