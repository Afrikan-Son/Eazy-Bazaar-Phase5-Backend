# frozen_string_literal: true

require 'rest-client'

Product.delete_all
# Delete all associated reviews first
Review.delete_all

# Delete all users
User.delete_all

# Reset primary key sequence for users table
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('products')

def products_dataset
  products = RestClient.get('https://fakestoreapi.com/products')
  products_array = JSON.parse(products)

  products_array.each do |product|
    Product.create(
      name: product['title'],
      price: product['price'],
      category: product['category'],
      description: product['description'],
      image: product['image'],
      instock: true,
      stock_count: rand(10..150)
    )
  end
end

products_dataset

Review.create(user_id: 1, rider_id: 1,
              description: 'Products delivered on time and in good state,would really recommend their services')

puts 'Seed complete!'
