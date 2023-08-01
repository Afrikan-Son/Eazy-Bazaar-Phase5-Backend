require 'rest-client'

Product.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('products')
def products_dataset
  products = RestClient.get("https://fakestoreapi.com/products") 
  products_array = JSON.parse(products)
  
  products_array.each do |product|
    Product.create(
      name: product["title"],
      price: product["price"],
      category: product["category"],
      description: product["description"],
      image: product["image"],
      instock: true, # Use hash syntax here instead of :in_stock
      stock_count: rand(10..150)
    )
  end
end
products_dataset()


puts "Seed complete!" 