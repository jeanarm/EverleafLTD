json.extract! usr, :id, :name, :email, :password_digest, :confirm_password, :admin, :created_at, :updated_at
json.url usr_url(usr, format: :json)
