require 'erb'

template = "2 + 2 = <%= @result %>"

@result = 2 + 2

renderer = ERB.new(template)
puts renderer.result(binding)
