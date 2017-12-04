class Application

@@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      new_item = req.params["item"]
      if @@items.include?(new_item)
        new_item.price
      else
        resp.status = 404
        resp.write "Item not found."
      end
    end
  end

end
