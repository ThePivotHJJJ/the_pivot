class Seed
  def self.start
    seed = Seed.new
    seed.generate_roles
    seed.generate_platform_admin
    seed.generate_business_admin

    # 20 total businesses
    # 10 tags
    # 50 items per tags
    # 100 registered customers, one with the following data:
    #   10 orders per registered customer
    #   1 business admins per business
    #
    #   Username: josh@turing.io
    #   Password: password
    #
    #   1 business admin
    #   Username: andrew@turing.io
    #   Password: password
    #
    #   1 platform administrators
    #   Username: jorge@turing.io
    #   Password: password


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
end

Seed.start
