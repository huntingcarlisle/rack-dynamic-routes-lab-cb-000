class Application

  # @@items = ["Apples","Carrots","Pears"]
  # @@cart = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
      if item
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

  # def handle_search(search_term)
  #   if @@items.include?(search_term)
  #     return "#{search_term} is one of our items"
  #   else
  #     return "Couldn't find #{search_term}"
  #   end
  # end
  
  # def handle_add(search_term)
  #   if @@items.include?(search_term)
  #     @@cart << search_term
  #     return "added #{search_term}"
  #   else
  #     return "We don't have that item"
  #   end
  # end
  
end