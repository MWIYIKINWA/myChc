import { Card } from "../components/card"

export default function Home() {
  return (
    <>
      <h1 className="title">My Dashboard</h1>
      <div className="container w-full justify-content-center align-center items-center">
      
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 ">
          
           
            <Card
            title="Devotions"
            description="12 SERMONS"
            to="/sermons"
          />
         

          <Card
            title="News Updates"
            description="10 POSTS"
            to="/news"
          />

          <Card
            title="Audio Posts"
            description="10 POSTS"
            to="/audio_sermons"
          />

          <Card
            title="Manage Users"
            description="03 USERS"
            to="/users"
          />

          </div>

      </div>
    </>
  )
}
