import { useContext } from 'react'
import { Link, Outlet, useNavigate } from 'react-router-dom'
import { AppContext } from '../context/AppContext'


export default function Layout() {
  
  const {appUser, token, setAppUser, setToken} = useContext(AppContext)
  const pagenavigate = useNavigate();

  async function handleLogout(e) {
    e.preventDefault();

    const res = await fetch("/api/logout", {
      method:'post',
      headers:{
        Authorization:`Bearer ${token}`,
      }
    });

    const data = await res.json();
    console.log(data);

   if (res.ok) {
      setAppUser(null);
      setToken(null);
      localStorage.removeItem('token')
      pagenavigate('/login')
   }

  }


  return (
    <>
      <header>
        <nav>
          <Link to="/" className='nav-link'>Dashboard</Link>
           
           {  appUser?
           
           (          
           
           <div className="flex items-center space-x-4">
              <p className='text-xs text-slate-500'>{appUser.name}</p>
              <form onSubmit={handleLogout}>
                <button className="nav-link">Logout</button>
              </form>
          </div>
           ):
           (     

           <div className="space-x-4">
          <Link to="/login" className='nav-link'>Login</Link>
          <Link to="/register" className='nav-link'>Register</Link>
          </div>)}

        </nav>
      </header>

      <main>
        <Outlet/>
      </main>
    </>
  )
}
