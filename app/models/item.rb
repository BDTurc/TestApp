class Item < ActiveRecord::Base
  belongs_to :types
  #take in a hash of params, will return only items for @items that match criteria from the AR query.
  def self.search(params)
    if params #our params hash with data from our search form
      if params[:match_all] == "1" #implement the AND logic
         find(:all, :conditions => ['type_id LIKE ? AND title LIKE ? AND description LIKE ? AND owner LIKE?', "%#{params[:type]}%", "%#{params[:title]}%", "%#{params[:description]}%", "%#{params[:owner]}%"])
      else
        params.each do |k, v|
          params[k] = "++" if params[k] == "" #by default, if a field is left blank, we can change from the ignore syntax "" to a filler, so that blank fields do not generate all results.
          params[k] = "" if k == "type" && params[k] == "Any"
        end
       find(:all, :conditions => ['type_id LIKE ? OR title LIKE ? OR description LIKE ? OR owner LIKE ?', "%#{params[:type]}%", "%#{params[:title]}%", "%#{params[:description]}%", "%#{params[:owner]}%"])
      end
    else
      find(:all) #By default just display all items, used for testing.
    end
  end
end
