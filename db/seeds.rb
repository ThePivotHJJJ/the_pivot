# class Seed
#   def start
#     create_tags
#     create_items
#     create_users
#     create_orders
#     create_order_items
#   end

#   def create_tags
#     10.times { Tag.create!(name: Faker::Hipster.word)}
#   end

#   def create_items
#     10.times do
#       item.create!(title: Faker::Lorem.sentence,
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
# end

# Seed.new.start

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# 10.times do
#   Tag.create(name: Faker::Hipster.word)
# end
# #
# 71.times do
#   item = item.create(title: Faker::Lorem.sentence,
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
#   item = item.all.shuffle.first
#   order = user.orders.create!(total_price: 3*subtotal)
#   order.order_items.create!(
#     item_id: item.id, quantity: 1, subtotal: subtotal
#   )
#   item = item.all.shuffle.first
#   order.order_items.create!(
#     item_id: item.id, quantity: 2, subtotal: subtotal*2
#   )
# end
