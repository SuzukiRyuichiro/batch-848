# students =     [ "Peter", "John", "Mary", "George", "Emma" ]
# student_age = [ 24     , 23    , 25    , 22      ,  20    ]
# student_height = [ 170     , 182    , 164    , 158      ,  189    ]

# # "Peter is 24 years old"
# # "Mary is 25 years old"

# students.each_with_index do |student, index|
#   age = student_ages[index]
#   puts "#{student} is #{age} years old"
# end

# puts student_age['Peter']
# puts student_age['Emma ']

# # CRUD in array
# fruits = ['apple', 'orange']
# # C: 
# fruits << 'mango'
# # R:
# fruits[1]
# # U:
# fruits[1] = 'peach'
# # D:
# fruits.delete_at(0)

# # CRUD in hashes
# tokyo = {
#   'country' => 'Japan',
# 	'population' => 13000000
# }

# # C: 
# tokyo['flower'] = 'Sakura'
# # R:
# tokyo['country'] # Japan
# # U:
# tokyo['population'] = 12000000
# # D:
# tokyo.delete('flower')

paris = { "country" => "France", "population" => 2211000 }

paris.each do |key, value|
  puts "Paris #{key} is #{value}"
end

japan = {
  'capital' => {
    'name' => 'tokyo',
    'governor' => {
      'name' => 'Yuriko Koike',
      'age' => 60
    }
  }
}




