students =     [ "Peter", "Louis", "Mary", "George", "Emma" ]
student_ages = [ 24     , 20,   25    , 22      ,  20    ]

# Peter is 24 years old
# Mary is 25 years old

students.each_with_index do |student, index|
  age = student_ages[index]
  puts "#{student} is #{age} years old"
end

paris = { # begins and ends with a {}
  #key      =>  value
  "country" => "France",
  "population" => 2211000
}

# CRUD in array
students = [ "Peter", "Louis", "Mary", "George", "Emma" ]
# C
students << "Ellie"
# R
students[2]
# U
students[0] = "Happy"
# D
students.delete_at(0)

# CRUD in hash
tokyo = {
  "country" => "Japan",
  "population" => 14000000
}

# C
tokyo["region"] = "Kanto"
# R
tokyo["population"]
# U
tokyo["population"] = 13000000
# D
# tokyo.delete("country")

tokyo.each do |key, value|
  "Key is #{key} and value is #{value}"
end

# key?("some_key") return if there's a key value pair in that hash
key_exits = false

tokyo.each do |key, value|
  key_exits = true if key == 'language'
end

# But this is done with some_hash.key?("key_in_question")

tokyo = {
  :country => "Japan",
  :population => 14000000
}

# These two are different
p tokyo[:country]
p tokyo["country"]

def tag(tag_name, content, attributes = {} )
  #  { class: "heading", style: "color: red;"　}
  # ↓
  # class="heading" style="color: red;"
  formatted_attributes = attributes.map { |key, value| "#{key}=\"#{value}\"" }

  formatted_attributes = formatted_attributes.join(" ")

  puts "<#{tag_name} #{formatted_attributes}>#{content}</#{tag_name}>"
end

tag("h1", "Hello World", class: "heading", style: "color: red;", id: "hello_world")
# "<h1 class="heading" style="color: red;">Hello World</h1>
