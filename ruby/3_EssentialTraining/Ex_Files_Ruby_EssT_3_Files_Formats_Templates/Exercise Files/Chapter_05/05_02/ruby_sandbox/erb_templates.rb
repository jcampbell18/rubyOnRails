require 'erb'

template = ""
template << "<% result = 2 + 2 %>"
template << "2 + 2 = <%= result %>"

renderer = ERB.new(template)
puts renderer.result
