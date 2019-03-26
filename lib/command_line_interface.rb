def greet
  puts 'Welcome back Mr. Scamander.'
end

def user_name
  name = gets.chomp.capitalize
end

def who_are_you
  puts "Wait you're not Newt Scamander. Who are you?"
  puts "Welcome #{user_name}! Ready to start creating your own book of fantastic beasts? (Y/N)"
  # answer = gets.chomp.downcase
  # if answer == n
    # exit
end

def search_question
  puts "Where would you like to begin your search?"
end

def find_a_myth
  puts "Would you like to search by: \n 1. Species \n 2. Location \n 3. Country of Origin \n 4. If It Has A Tail \n 5. If It Has Wings"
end

def select_a_search
  select = gets.chomp
  if select == "1"
    puts "You have chosen to search by species"
    search_by_species
  elsif select == "2"
    puts "You have chosen to search by location"
    search_by_location
  elsif select == "3"
    puts "You have chosen to search by the country of origin"
    search_by_origin_country
  elsif select == "4"
    puts "You have chosen to search by if the creature has a tail"
    search_by_tail
  elsif select == "5"
    puts "You have chosen to seach by if the creature has wings"
  else
    puts "I'm sorry #{user_name}, right now we dont have any searches in that category."
  end
end

def search_by_species
 species = Myth.pluck(:name)
 puts species.uniq
end

def search_by_location
 location = Myth.pluck(:location)
 puts location.uniq
end

def search_by_origin_country
 origin_country = Myth.pluck(:origin_country)
 puts origin_country.uniq
end

def search_by_tail
  Myth.all.map do |data|
  if data.has_tail == true
    data.name
  end
end.uniq
end
