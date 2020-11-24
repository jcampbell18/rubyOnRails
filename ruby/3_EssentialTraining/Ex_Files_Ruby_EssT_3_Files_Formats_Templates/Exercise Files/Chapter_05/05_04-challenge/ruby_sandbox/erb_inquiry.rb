require 'erb'

class Customer
  attr_accessor :first_name, :last_name, :email
end

@customer = Customer.new
@customer.first_name = "Billy"
@customer.last_name = "Binding"
@customer.email = 'noone@nowhere.com'

filename = 'inquiry.txt.erb'

template = File.read(filename)

output = ERB.new(template).result(binding)

puts output
