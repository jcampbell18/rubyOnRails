
require 'json'

json = File.read('us_presidents.json')

data = JSON.parse(json)

early_presidents = data['us_presidents'][0..9]

new_data = { 'early_presidents' => early_presidents }

# json = JSON.generate(new_data)
json = new_data.to_json

File.write('early_presidents.json', json)
