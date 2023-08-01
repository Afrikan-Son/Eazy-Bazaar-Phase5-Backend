require 'rest-client'

def products_dataset
   products = RestClient.get("https://fakestoreapi.com/products") 
   products_array = JSON.parse(products)
   #puts(products_array)  
    products_array.each do |s| 
        Product.create(name: s["title"], price: s["price"], category: s["category"], description: s["description"], image: s["image"])
    end
end
products_dataset()

puts "Seed complete!" 