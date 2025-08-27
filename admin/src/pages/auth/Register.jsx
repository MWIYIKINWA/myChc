import { useContext, useState } from "react"
import { useNavigate } from "react-router-dom";
import { AppContext } from "../../context/AppContext";

export default function Register() {


  //declare

  const pagenavigate = useNavigate();
  const {token, setToken} = useContext(AppContext);
   
  const [formData, setFormData] = useState({
    name :'',
    email :'',
    password :'',
    password_confirmation :'',
  })

   const [errors, setErrors] = useState({});


   //handle submission
  async function handleSubmit(e) {
    e.preventDefault();

    const res = await fetch("/api/register", {
      method:"post",
      body:JSON.stringify(formData),
    })

    const data = await res.json();

    if (data.errors) {
      setErrors(data.errors)
    }
    else{
     
    // localStorage.setItem("token", data.token) 
    // setToken(data.token);
    pagenavigate("/users")
    
    }


  }

  //...........................................
  return (
    <>
      <h1 className="title">Register new User</h1>
  
      <form className="w-1/2 mx-auto space-y-4" onSubmit={handleSubmit} >

      <div>
        <input type="text" placeholder="name" value={formData.name} onChange={(e)=> setFormData({...formData, name: e.target.value})} />
        {errors.name && <p className="error">{errors.name[0]}</p> }
      </div>

      <div>
        <input type="email" placeholder="Email" value={formData.email} onChange={(e)=> setFormData({...formData, email: e.target.value})}/>
        {errors.email && <p className="error">{errors.email[0]}</p> }
      </div>

      <div>
        <input type="password" placeholder="password" value={formData.password} onChange={(e)=> setFormData({...formData, password: e.target.value})}/>
        {errors.password && <p className="error">{errors.password[0]}</p> }
      </div>

      <div>
        <input type="password" placeholder="confirm password" value={formData.password_confirmation} onChange={(e)=> setFormData({...formData, password_confirmation: e.target.value})}/>
        {/* {errors.password_confirmation && <p className="error">{errors.password_confirmation[0]}</p> } */}
      </div>

      <div>
        <button className="w-1/2 mx-auto  primary-btn">Send</button>
      </div>

      </form>

    </>
  )
}
