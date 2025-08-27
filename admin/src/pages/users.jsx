import { useNavigate } from "react-router-dom"
import { Title } from "../components/title"
import { CirclePlus, Key } from "lucide-react"
import { useEffect, useState, useContext } from "react";
import { AppContext } from "../context/AppContext";
  


export const Users = () => {

const pagenavigate = useNavigate();
const [allusers, setAllusers] = useState([])
const {token} = useContext(AppContext);




//get all users

 async function getUsers() {
    const res = await fetch("/api/allusers" 
     // {
      //   headers:{
      //   Authorization : `Bearer ${token}`,
      // },
   // }
  );
    const data = await res.json();

    if (res.ok) {
      setAllusers(data)
      console.log(data)
      //setFilteredSermons(data);    
    }
    
  }

  useEffect(()=>{
    getUsers()
  },[ allusers])


//...................................MARKUP

  return (
    
    <>

      {/* title */}
    <Title title_text="Users"  to="/"  />

     <div className="flex flex-row space-x-10 w-full">


        {/* Search input */}
        {/* <div className="relative flex-1 max-w-md">
          <input
            type="text"
            placeholder="Search devotions..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
          />
        </div> */}

        {/* button */}
      <button  onClick={()=> pagenavigate("/register")}
          className="px-4 py-2 flex items-center bg-orange-500 text-white rounded-md hover:bg-slate-700 transition-colors"> 
          <CirclePlus className="mx-3" /> 
            Create User
      </button>

    </div>


    {/* //display all users */}

           {allusers.length > 0 ? (
            allusers.map((admin) => (<div key={admin.id} className="flex justify-between mt-5 p-4 border rounded-md border-dashed border-slate-400">
            <div>
              <div>
            <h5 className="text-xl font-bold text-orange-500">{admin.name}</h5>
          <p>{admin.email}</p>
              </div>
            </div>
              <div className="flex flex-col">
          <View className="text-slate-600 w-4 h-4"  />
         
            
            <div className="mt-3">
              <Trash2 className="text-slate-600 w-4 h-4" />
              <SquarePen className="text-slate-600 w-4 h-4 mt-3" />
            </div>
         
      </div>
           </div>))) 
           : 
           (<h5 className="mt-5 text-center">No Users posted</h5>)}

    </>
    
    
  )
}

