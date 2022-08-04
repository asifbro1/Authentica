import {Link, Routes} from 'react-router-dom'
import './header.css'
import Header from "./Header";
import Main from "./Main";
import Footer from "./Footer";

const Home = () => {
    return (
        <div className='container'>
            <Header />
            <body>
            <Main />    
            </body>
            <Footer />
        </div>
    )
}

export default Home