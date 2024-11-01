if defined?(Spree::Auth)
    Spree::PermittedAttributes.user_attributes << :admin
end