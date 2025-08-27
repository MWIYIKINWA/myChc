import { useContext, useState } from "react"
import { useNavigate } from "react-router-dom";
import { AppContext } from "../../context/AppContext";

export default function Login() {


  //declare

  const pagenavigate = useNavigate();
  const {token, setToken} = useContext(AppContext);
   
  const [formData, setFormData] = useState({
    
    email :'',
    password :'',
    
  })

   const [errors, setErrors] = useState({});


   //handle submission
  async function handleSubmit(e) {
    e.preventDefault();

    const res = await fetch("/api/login", {
      method:"post",
      body:JSON.stringify(formData),
    })

    const data = await res.json();

    if (data.errors) {
      setErrors(data.errors)
    }
    else{
     
    localStorage.setItem("token", data.token) 
    setToken(data.token);
    console.log(data);
    pagenavigate("/")
   
    }


  }

  //...........................................
  return (
    <>
      <h1 className="title">Login</h1>
  
      <form className="w-1/2 mx-auto space-y-4" onSubmit={handleSubmit} >

      <div>
        <input type="email" name="email" placeholder="Email" value={formData.email} onChange={(e)=> setFormData({...formData, email: e.target.value})}/>
        {errors.email && <p className="error">{errors.email[0]}</p> }
      </div>

      <div>
        <input type="password" name="password" placeholder="password" value={formData.password} onChange={(e)=> setFormData({...formData, password: e.target.value})}/>
        {errors.password && <p className="error">{errors.password[0]}</p> }
      </div>

      <div>
        <button className="w-1/2 mx-auto  primary-btn">Sign in</button>
      </div>

      </form>

    </>
  )
}
