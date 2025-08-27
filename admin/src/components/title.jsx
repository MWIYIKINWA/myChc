import { ChevronLeft} from 'lucide-react'
import { Link } from 'react-router-dom'

export const Title = ({title_text, to}) => {
  return (
    <div className='flex items-center space-x-60'>
    <Link to={to} >
      <ChevronLeft />
      </Link>
      <h1 className="title text-orange-500">{title_text}</h1>
    </div>
  )
}
