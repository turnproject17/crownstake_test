module TestDataSetup
  def create_user
    user = User.new(email: "crownstake@example.com", password: "121212")
    user.save
    return user
  end


  def create_products
    Product.create([{name:"new", description: "text", price: "102", make:2012}, {name:"new second", description: "asd", price: "210", make:2012}])
  end
end