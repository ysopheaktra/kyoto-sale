#init admin user

User.create!(name:  "Sopheaktra Yong",
             email: "sopheaktra.yong@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)
