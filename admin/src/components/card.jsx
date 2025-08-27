
import { ArrowDownRight} from "lucide-react";
import { Link } from "react-router-dom";

export const Card = ({ title, description, to }) => {
  return (
    <Link 
      to={to} 
      className="h-full flex flex-col group" 
    >
      <div className="flex-1 p-6 rounded-lg shadow-md bg-white border border-gray-100 transition-all duration-300 hover:shadow-lg hover:border-orange-100 group-hover:border-orange-200">
        <h3 className="font-bold text-xl mb-3 text-gray-800 group-hover:text-orange-600">
          {title}
        </h3>
        <p className="text-gray-600 text-base mb-4">
          {description || 'No description provided.'}
        </p>
        <div className="mt-auto">
          <ArrowDownRight className="text-orange-500 group-hover:text-orange-600 group-hover:translate-x-1 group-hover:-translate-y-1 transition-all" />
        </div>
      </div>
    </Link>
  );
};


