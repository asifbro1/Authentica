import { EthProvider } from "./contexts/EthContext";
import { Routes, Route} from 'react-router-dom';
import Home from './Layout/Home';
import Verification from "./components/Verification/Verification";
import Generation from "./components/Generation/Generation";
import './App.css'

function App() {
  return (
    <EthProvider>
        <Routes>
          <Route path="/" element={<Home />} >
            <Route path="verify-certificate" element={<Verification />} />
            <Route path="generate-certificate" element={<Generation />} />
          </Route>
          {/* <Route path="/verify" element={<Verification />} /> */}
        </Routes>
    </EthProvider>
  );
}

export default App;

