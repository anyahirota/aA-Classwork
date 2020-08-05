import React from 'react'; 
import Header from './header'; 


class Tabs extends React.Component {

    constructor(props) {
        super(props); 
        this.state = {
            selected: 0
        };
        // this.setIndex = this.setIndex.bind(this); 
    }

    setIndex(idx) { 
        return (event) => {
            event.preventDefault(); 
            this.setState({selected: idx});
        }
        // event.preventDefault();
        // const idx = event.currentTarget.class; 
        // debugger
        // console.log(idx);
        // this.setState({selected: idx}); 
    }

    render() {
        return (
            <div>
                <h1 className="tabs-section-title">Tabs</h1>
                <div className="tabs">
                    <ul className="headers">
                        {this.props.arr.map((tab, idx) => {
                            return(
                                <li >
                                    <button className="tab-button" onClick={this.setIndex(idx)}>
                                        <Header title={tab.title}/>
                                    </button>
                                </li>
                            )
                            })} 
                    </ul>
                    <article className="tab-content">
                        {this.props.arr[this.state.selected].content}
                    </article>
                </div>
            </div>
        ) 
    }
} 

    // {props.listings.map(listing => {
//         return(
//           <JobIndexItem key={listing.id} 
//           company={listing.company} 
//           title={listing.title}
//           location={listing.location} />
//         )
//       })}

export default Tabs;    

// handleClick(index) {
//     this.setState({ selected: index })
//     console.log(this.state.selected)
//     console.log(index)
// }

// renderTitles() {
//     return tabTitle.map((el, index) => {
//         return (
//             <li key={index}>
//                 <a href="#"
//                     onClick={this.handleClick.bind(this, index)}>
//                     {el}
//                 </a>
//             </li>
//         );
//     })
// }

// render() {
//     return (
//         <div>
//             <ul>{this.renderTitles()}</ul>
//         </div>
//     );
// }

// const JobIndex = (props) => {
//   return(
//     <ul>
//       {props.listings.map( listing => {
//         return(
//           <JobIndexItem key={listing.id} 
//           company={listing.company} 
//           title={listing.title}
//           location={listing.location} />
//         )
//       })}
//     </ul>
//   )
// }