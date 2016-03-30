class Seed
  def self.start
    seed = Seed.new
    seed.generate_roles
    seed.generate_platform_admin
    seed.generate_business_admin
    seed.generate_registered_user
    seed.generate_tags

    # 20 total businesses
    # 10 tags
    # 50 items per tags
    # 100 registered customers, one with the following data:
    #   10 orders per registered customer
    #   1 business admins per business

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
  end

  def generate_business_admin
    user = User.create!(
      username: "andrew@turing.io",
      password: "password",
      email:    "andrew@turing.io"
    )
    user.roles << Role.find_by(name: "business_admin")
  end

  def generate_registered_user
    user = User.create!(
      username: "josh@turing.io",
      password: "password",
      email: "josh@turing.io"
    )
    user.roles << Role.find_by(name: "registered_user")
  end

  def generate_tags
    10.times do |i|
      tag = Tag.create!(
        name: Faker::Commerce.department
      )
      puts "Tag #{i}: #{tag.name} created!"
    end
  end
end

Seed.start
