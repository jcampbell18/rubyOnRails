# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# similar results shown in the comments.

# irb
require 'date'
# => true
Date.today
# => #<Date: 2018-10-10 ((2458402j,0s,0n),+0s,2299161j)>
Date.today.month
# => 10
Date.today.year
# => 2018
Time.now.to_date
# => #<Date: 2018-10-10 ((2458402j,0s,0n),+0s,2299161j)>
Time.now.to_date.class
# => Date
Date.today.next_year
# => #<Date: 2019-10-10 ((2458767j,0s,0n),+0s,2299161j)>
Date.today.next_year.year
# => 2019
date = Date.today
# => #<Date: 2018-10-10 ((2458402j,0s,0n),+0s,2299161j)>
date.leap?
# => false
date.next_year.leap?
# => false
date.next_year.next_year.leap?
# => true
exit
