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
        resp.status = 400
        resp.write "We don't have that item"
      end
    end
  end

end
