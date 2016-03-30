class Seed
  def self.start
    seed = Seed.new
    seed.generate_roles
    seed.generate_platform_admin
    seed.generate_business_admin
    seed.generate_registered_user
    seed.generate_tags
    seed.generate_shops
    seed.generate_users
    # 100 registered customers, one with the following data:
    #   10 orders per registered customer

  end

  def generate_roles
    Role.create!(name: "registered_user")
    Role.create!(name: "business_admin")
    Role.create!(name: "platform_admin")
  end

  def generate_platform_admin
    user = User.create!(
      username: "jorge@turing.io",
      password: "password",
      email:    "jorge@turing.io"
    )
    user.roles << Role.find_by(name: "platform_admin")
    puts "#{user.username} was created!"
  end

  def generate_business_admin
    user = User.create!(
      username: "andrew@turing.io",
      password: "password",
      email:    "andrew@turing.io"
    )
    user.roles << Role.find_by(name: "business_admin")
    puts "#{user.username} was created!"
  end

  def generate_registered_user
    user = User.create!(
      username: "josh@turing.io",
      password: "password",
      email: "josh@turing.io"
    )
    user.roles << Role.find_by(name: "registered_user")
    puts "#{user.username} was created!"
  end

  def generate_tags
    10.times do |i|
      tag = Tag.create!(
        name: Faker::Commerce.department
      )
      puts "Tag #{i}: #{tag.name} created!"
    end
  end

  def generate_shops
    20.times do |i|
      shop = Shop.create!(
        name: Faker::Company.name
      )
      add_business_admin(shop, i)
      add_items(shop)
      puts "Shops #{i}: #{shop.name} created!"
    end
  end

  def generate_users
    100.times do |i|
      user = User.create!(
        username: Faker::Name.name,
        password: "password",
        email:    Faker::Internet.email
      )
      puts "Registered User #{i}: #{user.username} created!"
    end
  end

  private

    def add_business_admin(shop, i)
      user = shop.users.create!(
        username: Faker::Name.name,
        password: "password",
        email:    Faker::Internet.email
      )
      puts "Business Admin #{i}: #{user.username} created!"
    end

    def add_items(shop)
      Tag.all.each do |tag|
        50.times do |i|
          item = tag.items.create!(
            title: Faker::Commerce.product_name,
            description: Faker::Lorem.paragraph,
            price: Faker::Commerce.price,
            # image: "https://unsplash.it/300/?random",
            shop_id: shop.id
          )
          puts "Item #{i}: Item created for #{tag.name} and #{shop.name}"
        end
      end
    end
end

Seed.start
