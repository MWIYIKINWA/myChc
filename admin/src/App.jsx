import './App.css'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Layout from "./pages/Layout"
import Home from "./pages/Home"
import Register from './pages/auth/Register'
import Login from './pages/auth/Login'
import { useContext } from 'react'
import { AppContext } from './context/AppContext'
import { News } from './pages/news'
import { Users } from './pages/users'
import { Sermons } from './pages/sermons'
import { Audio_sermons } from './pages/audio_sermons'

export default function App() {

  const {appUser} = useContext(AppContext)

  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout/>}>
          <Route index element={appUser?<Home/>:<Login/>} />
          <Route path='/register' element={<Register/>} />
          <Route path='/login' element={appUser?<Home/>:<Login/>} />
          <Route path='/sermons' element={appUser?<Sermons/>:<Login/>} />
          <Route path='/news' element={appUser?<News/>:<Login/>} />
          <Route path='/users' element={appUser?<Users/>:<Login/>} />
          <Route path='/audio_sermons' element={appUser?<Audio_sermons/>:<Login/>} />
        </Route>
      </Routes>
    </BrowserRouter>
  )
}