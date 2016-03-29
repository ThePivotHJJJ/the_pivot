class Seed
  def start
      create_roles
      create_platform_admin
      create_shops
      create_business_admins
#     create_tags
#     create_items
#     create_users
#     create_orders
#     create_order_items
  end

  def create_roles
    Role.create(name: "registered_user")
    Role.create(name: "business_admin")
    Role.create(name: "platform_admin")
    puts "created roles"
  end

  def create_platform_admin
    user = User.create(username: "Jorge@turing.io", 
                       password: "password")
    user.roles << Role.find_by(name: "platform_admin")
    puts "created platform admin"
  end

  def create_shops
    20.times do
     shop = Shop.create(name: Faker::Company.name) 
     puts "created the shop #{shop.name}"
   end
  end

  def create_business_admins
    40.times do
      user = User.create(username: Faker::Internet.user_name,
                         password: "password",
                         shop_id: Shop.all.sample.id)
      user.roles << Role.find_by(name: "business_admin")
      puts "created business admin #{user.username} for shop #{user.shop_id}" 
    end
  end

#   def create_tags
#     10.times { Tag.create!(name: Faker::Hipster.word)}
#   end

#   def create_items
#     10.times do
#       Item.create!(title: Faker::Lorem.sentence,
#         description: Faker::Hipster.word,
#         price: Random.rand(1..1000),
#         image: Faker::Avatar.image
#         tags: Tag.all.sample)
#   end

#   def create_users
#     50.times do
#       User.create!(username: Faker::Internet.user_name,
#         password: Faker::Internet.password)
#     end
#   end

#   def create_orders

#   end

#   def create_order_items

#   end
end

Seed.new.start

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# 10.times do
#   Tag.create(name: Faker::Hipster.word)
# end
# #
# 71.times do
#   item = Item.create(title: Faker::Lorem.sentence,
#               description: " adfg",
#               price: 100,
#               image: "https://placeholdit.imgix.net/~text?txtsize=60&bg=000000&txt=640%C3%97480&w=640&h=480&fm=png"
#               )
#   item.tags << Tag.all.shuffle.first
# end
#
#
# 20.times do
#   subtotal = Random.new.rand(1..10)
#   user = User.create(username: "string", password: "password")
#   item = Item.all.shuffle.first
#   order = user.orders.create!(total_price: 3*subtotal)
#   order.order_items.create!(
#     item_id: item.id, quantity: 1, subtotal: subtotal
#   )
#   item = Item.all.shuffle.first
#   order.order_items.create!(
#     item_id: item.id, quantity: 2, subtotal: subtotal*2
#   )
# end
