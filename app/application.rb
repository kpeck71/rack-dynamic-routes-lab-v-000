class Application

@@items = [Item.new("item1",15.00), Item.new("item2",2.00)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/items/"
      new_item = req.params["item"]
      if @@items.include?(new_item)
        resp.write "#{new_item.price}"
      else
        resp.status = 404
        resp.write "Item not found."
      end
    end
  end

end
