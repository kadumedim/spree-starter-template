if defined?(Spree::Auth)
    Rails.application.config.after_initialize do
      if Spree::User.count.zero? && ENV['ADMIN_EMAIL'] && ENV['ADMIN_PASSWORD']
        admin = Spree::User.create!(
          email: ENV['ADMIN_EMAIL'],
          password: ENV['ADMIN_PASSWORD'],
          password_confirmation: ENV['ADMIN_PASSWORD']
        )
        admin_role = Spree::Role.find_or_create_by!(name: 'admin')
        admin.spree_roles << admin_role
        end
    end
end