class Application

  # @@items = ["Apples","Carrots","Pears"]
  # @@cart = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
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