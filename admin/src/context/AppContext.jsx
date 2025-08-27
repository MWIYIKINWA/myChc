import { Children, createContext, useEffect, useState } from "react";

export const AppContext = createContext();

import React from 'react'

export const AppProvider = ({children}) => {

    const [token, setToken] = useState(localStorage.getItem('token'))
    const [appUser, setAppUser]  = useState(null);

    async function getAppUser() {

      const res = await fetch("/api/user",{
        headers:{
           Authorization:`Bearer ${token}`,
        },
      })

      const data = await res.json();

      if (res.ok) {
        setAppUser(data);
      }
      
    }

    useEffect(()=>{
      if (token) 
        { getAppUser();

        }
      },
      [token]
    );



  return (
   <AppContext.Provider value={{token, setToken, appUser, setAppUser}}>
    {children}
   </AppContext.Provider>
  )
}
