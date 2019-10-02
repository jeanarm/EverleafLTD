FactoryBot.define do
  factory :usr do
    name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    confirm_password { "MyString" }
    admin { false }
  end
end
