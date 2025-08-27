import { CirclePlus, Trash2, SquarePen, View, Search } from "lucide-react"
import { Title } from "../components/title"
import { useContext, useEffect, useState } from 'react';
import { X } from 'lucide-react';
import { AppContext } from "../context/AppContext";


export const Sermons = () => {

  const [isOpen, setIsOpen] = useState(false);
  const {token, appUser} = useContext(AppContext);
  const [formData, setFormData] = useState({
     title:'',
     scripture:'',
     message:'',
  })
    const [editFormData, setEditFormData] = useState({
     id: '',
     title:'',
     scripture:'',
     message:'',
  })
  const [errors, setErrors] = useState({})
  const [sermons, setSermons] = useState([])
  const [viewModalOpen, setViewModalOpen] = useState(false);
  const [editModalOpen, setEditModalOpen] = useState(false);
  const [selectedSermon, setSelectedSermon] = useState(null);
  const [filteredSermons, setFilteredSermons] = useState([])
  const [searchTerm, setSearchTerm] = useState('')

    useEffect(()=>{
      getSermons();
    }, [])

    useEffect(() => {
       filterSermons();
     }, [searchTerm, sermons])

  // Filter sermons based on search term
  
  const filterSermons = () => {
    if (!searchTerm.trim()) {
      setFilteredSermons(sermons);
      return;
    }

    const searchLower = searchTerm.toLowerCase();
    const filtered = sermons.filter(sermon => 
      sermon.title.toLowerCase().includes(searchLower) ||
      sermon.scripture.toLowerCase().includes(searchLower) ||
      sermon.message.toLowerCase().includes(searchLower) ||
      (sermon.user?.name && sermon.user.name.toLowerCase().includes(searchLower))
    );
    
    setFilteredSermons(filtered);
  }



  //handle posting.....................................

  async function handleSubmit(e) {

    e.preventDefault();

    const res = await fetch("/api/sermons", {
      method:"post",
      headers:{
        Authorization : `Bearer ${token}`,
      },
      body:JSON.stringify(formData)
    });
    
    const data = await res.json();

    if (data.errors) {
      setErrors(data.errors)
    }
    else{

        setFormData({
          title: '',
          scripture: '',
          message: '',
        });
   
      setErrors({});
      setIsOpen(false)

      setSermons(prevSermons => [data.sermon, ...prevSermons]); 
      
    }
    
  }

  //handle get devotions........................................

  async function getSermons() {
    const res = await fetch("/api/sermons");
    const data = await res.json();

    if (res.ok) {
      setSermons(data)
      setFilteredSermons(data);    
    }
    
  }

  // open view modal with selected sermon.................................

  const openViewModal = (sermon) => {
    setSelectedSermon(sermon);
    setViewModalOpen(true);
  }

 // open edit modal with selected sermon.....................

  const openEditModal = (sermon) => {
    setEditFormData({
      id: sermon.id,
      title: sermon.title,
      scripture: sermon.scripture,
      message: sermon.message
    });
    setEditModalOpen(true);
    setErrors({});
  }

  ///edit devotions..............................................

    async function handleUpdate(e) {
    e.preventDefault();
    const res = await fetch(`/api/sermons/${editFormData.id}`, {
      method:"PUT",
      headers:{
        Authorization : `Bearer ${token}`,
        'Content-Type': 'application/json'
      },
      body:JSON.stringify(editFormData)
    });
    
    const data = await res.json();

    if (data.errors) {
      setErrors(data.errors)
    }
    else{
      setEditModalOpen(false);
      setSermons(prevSermons => 
        prevSermons.map(sermon => 
          sermon.id === editFormData.id ? data.sermon : sermon
        )
      ); 
    }
  }

  //delete devotions..............................................

  async function handleDelete(sermonId){

    if (window.confirm("Are you sure you want to delete this Devotion")) {

      
         const res = await fetch(`/api/sermons/${sermonId}`, {
           method:"delete",
           headers:{
            Authorization: `Bearer ${token}`,
           }
         })

         if (res.ok) {
          setSermons(prevSermons => 
          prevSermons.filter(sermon => sermon.id !== sermonId)
        );
         }
      
      
    }
    
  }


  //MARKUP

  return (
  <>
       
    {/* title */}
       <Title title_text="Devotions"  to="/"  />

  <div className="flex flex-row space-x-10 w-full">


        {/* Search input */}
        <div className="relative flex-1 max-w-md">
          <input
            type="text"
            placeholder="Search devotions..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
          />
        </div>

        {/* button */}
      <button  
          onClick={() => setIsOpen(true)}
          className="px-4 py-2 flex items-center bg-orange-500 text-white rounded-md hover:bg-slate-700 transition-colors"> 
          <CirclePlus className="mx-3" /> 
            Create sermon
      </button>

    </div>

{/* Create form */}

      {isOpen && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          {/* Modal Container */}
          <div className="bg-white rounded-lg shadow-xl w-full max-w-md">
            {/* Modal Header */}
            <div className="flex justify-between items-center border-b p-4">
              <h3 className="text-lg font-semibold">Devotion</h3>
              <button 
                onClick={() => setIsOpen(false)}
                className="text-gray-500 hover:text-gray-700"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            {/* Modal Body (Form) */}
            <form onSubmit={handleSubmit} >
              <div className="p-4 space-y-4">
              <div>
                <input type="text" name="title" placeholder="Devotion Title" value={formData.title} onChange={(e) => setFormData({...formData, title : e.target.value})}/>
                 {errors.title && <p className="error">{errors.title[0]}</p> }
              </div>

              <div>
                <input type="text" name="scripture" placeholder="Scripture"  value={formData.scripture} onChange={(e) => setFormData({...formData, scripture : e.target.value})}/>
                  {errors.scripture && <p className="error">{errors.scripture[0]}</p> }
              </div>

              <div>
                <textarea rows="4" name="message" placeholder="Message"  value={formData.message} onChange={(e) => setFormData({...formData, message : e.target.value})}/>
                {errors.message && <p className="error">{errors.message[0]}</p> }
              </div>
              <button className="primary-btn">Post</button>
            </div>
          </form>
          </div>
        </div>
      )}
    

       {/* Edit Modal */}
    {editModalOpen && (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
        <div className="bg-white rounded-lg shadow-xl w-full max-w-md">
          <div className="flex justify-between items-center border-b p-4">
            <h3 className="text-lg font-semibold">Edit Sermon</h3>
            <button 
              onClick={() => setEditModalOpen(false)}
              className="text-gray-500 hover:text-gray-700"
            >
              <X className="w-5 h-5" />
            </button>
          </div>

          <form onSubmit={handleUpdate}>
            <div className="p-4 space-y-4">
              <div>
                <input 
                  type="text" 
                  name="title" 
                  placeholder="Sermon Title" 
                  value={editFormData.title} 
                  onChange={(e) => setEditFormData({...editFormData, title: e.target.value})}
                  className="w-full p-2 border rounded"
                />
                {errors.title && <p className="text-red-500 text-sm">{errors.title[0]}</p>}
              </div>

              <div>
                <input 
                  type="text" 
                  name="scripture" 
                  placeholder="Scripture"  
                  value={editFormData.scripture} 
                  onChange={(e) => setEditFormData({...editFormData, scripture: e.target.value})}
                  className="w-full p-2 border rounded"
                />
                {errors.scripture && <p className="text-red-500 text-sm">{errors.scripture[0]}</p>}
              </div>

              <div>
                <textarea 
                  rows="4" 
                  name="message" 
                  placeholder="Message"  
                  value={editFormData.message} 
                  onChange={(e) => setEditFormData({...editFormData, message: e.target.value})}
                  className="w-full p-2 border rounded"
                />
                {errors.message && <p className="text-red-500 text-sm">{errors.message[0]}</p>}
              </div>
              <button className="primary-btn">Update</button>
            </div>
          </form>
        </div>
      </div>
    )}


    {/* View Sermon Modal */}

    {viewModalOpen && selectedSermon && (
      <div className="fixed inset-0 bg-black bg-opacity-70 flex items-center justify-center z-50 p-4">
        <div className="bg-white rounded-lg shadow-xl w-full max-w-2xl max-h-[90vh] overflow-y-auto">
          <div className="flex justify-between items-center border-b p-4 sticky top-0 bg-white">
            <h3 className="text-lg font-semibold">Sermon Details</h3>
            <button 
              onClick={() => setViewModalOpen(false)}
              className="text-gray-500 hover:text-gray-700"
            >
              <X className="w-5 h-5" />
            </button>
          </div>
          
          <div className="p-6">
            <h2 className="text-2xl font-bold text-orange-500 mb-2">{selectedSermon.title}</h2>
            <p className="text-gray-700 font-medium mb-4">{selectedSermon.scripture}</p>
            
            <div className="flex items-center text-sm text-gray-500 mb-6">
              <span>Posted on {new Date(selectedSermon.created_at).toLocaleDateString()}</span>
              <span className="mx-2">•</span>
              <span className="text-orange-500">By {selectedSermon.user?.name || 'Unknown'}</span>
            </div>
            
            <div className="bg-gray-50 p-4 rounded-lg">
              <p className="text-gray-700 whitespace-pre-line">{selectedSermon.message}</p>
            </div>
          </div>
          
          <div className="border-t p-4 flex justify-end">
            <button 
              onClick={() => setViewModalOpen(false)}
              className="px-4 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300 transition-colors"
            >
              Close
            </button>
          </div>
        </div>
      </div>
    )}

     {/* My Devotions */}

 {filteredSermons.length > 0 ? (
  filteredSermons.map((sermon) => (
    <div className=" flex justify-between mt-5 p-4 border rounded-md border-dashed border-slate-400" key={sermon.id}>
      <div>
        <div>
          <h5 className="text-xl font-bold text-orange-500">{sermon.title}</h5>
          <p>{sermon.scripture}</p>
          <small className="text-xs">Created on {new Date(sermon.created_at).toLocaleDateString()}</small>
          <small className="text-orange-400 mx-3">By {sermon.user.name}</small>
        </div>
      </div>
      <div className="flex flex-col">
          <View className="text-slate-600 w-4 h-4"  onClick={() => openViewModal(sermon)}/>
         {
            appUser && appUser.id === sermon.user.id &&
            <div className="mt-3">
              <Trash2 className="text-slate-600 w-4 h-4" onClick={() => handleDelete(sermon.id)}/>
              <SquarePen className="text-slate-600 w-4 h-4 mt-3" onClick={()=> openEditModal(sermon)}/>
            </div>
         }
      </div>
    </div>
  ))
) : (
  <h5 className="mt-5 text-center">No Devotions posted</h5>
)}

    </>
  )
}
