
require 'psych'

yaml = File.read('us_presidents.yml')

data = Psych.load(yaml)

early_presidents = data['us_presidents'][0..9]

new_data = {'early_presidents' => early_presidents}

# yaml = Psych.dump(new_data)
yaml = new_data.to_yaml

File.write("early_presidents.yml", yaml)
