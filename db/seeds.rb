admin_username = 'admin'
admin_password = rand(36**8).to_s(36)

Credential.create! username: admin_username, password: admin_password

puts "Login Credentials"
puts "username: #{admin_username}"
puts "password: #{admin_password}"
