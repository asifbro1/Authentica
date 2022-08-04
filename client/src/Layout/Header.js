import {Link} from 'react-router-dom'
import './header.css'

const Header = () => {
    return (
        <header className='header'>
            <a href="/" className='logo'>Authentica</a>
            <nav>
                <Link to="/verify-certificate">Verify Certificate</Link>
                <Link to="/generate-certificate">Generate Certificate</Link>
            </nav>
        </header>
    )
}

export default Header