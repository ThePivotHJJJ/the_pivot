class Seed
  def self.start
    seed = Seed.new
    seed.generate_users
    seed.generate_tags
    seed.generate_items
    # seed.generate_orders
    seed.generate_shops
  end

  def generate_users
    50.times do |i|
      user = User.create!(
        username: Faker::Name.name,
        password: "password"
      )
      puts "User #{i}: #{user.username} created!"
    end
  end

  def generate_tags
    10.times do |i|
      tag = Tag.create!(
        name: Faker::Commerce.department
      )
      puts "Tag #{i}: #{tag.name} created!"
    end
  end

  def generate_items
    image = File.open(Dir.glob(File.join(Rails.root, "sample_images", "*")).sample)
    50.times do |i|
      item = Item.create!(
        title: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        price: Faker::Commerce.price,
        image: image)
      item.tags << Tag.limit(5).order("RANDOM()")
      puts "Item #{i}: #{item.title} created!"
    end
  end

  def generate_shops
    50.times do |i|
      shop = Shop.create!(
        name: Faker::Company.name
      )
      puts "Shop #{i}: #{shop.name} created!"
    end
  end
end

Seed.start
