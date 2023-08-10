# frozen_string_literal: true

require 'rest-client'

Product.delete_all
Rider.delete_all
User.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('products')
ActiveRecord::Base.connection.reset_pk_sequence!('riders')

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


def generate_random_phone_number
  rand(254_710_000_000..254_799_999_999)
end

6.times do
  Rider.create(
    name: Faker::Name.name,
    phone_number: generate_random_phone_number
  )
end

Rider.create(name: "Mark Kamau", phone_number: 0700000000)
Rider.create(name: "Andrew Njuguna", phone_number: 0700444400)

Review.create(user_id:1, rider_id:1, description: "Products delivered on time and in good state,would really recommend their services")


puts 'Seed complete!'
