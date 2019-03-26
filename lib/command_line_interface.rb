class CLI

  attr_accessor :user, :myth
  @@book = []

  def initialize
    @user = nil
    @myth = nil
  end

  def greet
    puts 'Welcome back Mr. Scamander.'
  end

  def hit_space
    space = gets.chomp.capitalize
    puts space
  end

  def who_are_you
    puts "Wait you're not Newt Scamander. Who are you?"
    name = gets.chomp
    @user = User.find_or_create_by(name: "#{name}")
    puts "\n \n"
    puts "Welcome #{@user.name.capitalize}! Ready to start creating your own book of fantastic beasts? (Y/N)"
    yes_or_no
  end

  def yes_or_no
    answer = gets.chomp.downcase
    if answer == "y" || answer == "yes" || answer == "ok" || answer == "sure" || answer == "yeah"
      puts "\n \n"
      puts "Great! Let's Go!"
    else
      puts "Alright, maybe next time."
      exit
    end
  end

  # def search_question
  #   puts "Where would you like to begin your search?"
  # end

  def find_a_myth
    puts "Where would you like to begin your search? You can search by:"
    puts "~*~*~*~*~*~*~*~*~*~*~*~*"
    puts "\s1. Species \n 2. Location \n 3. Country of Origin \n 4. Does It Have A Tail? \n 5. Does It Have Wings?"
    puts "~*~*~*~*~*~*~*~*~*~*~*~*"
    puts "\n \n \n"
  end

  def select_a_search
    select = gets.chomp.downcase
    puts "\n \n \n"
    if select == "1" || select == "species"
      puts "You have chosen to search by species. Which one would you like to learn more about? \n"
      puts "~*~*~*~*~*~*~*~*~*~*~*~*"
      search_by_species
      species_info
      puts "\n"
      save_to_book
    elsif select == "2" || select == "location"
      puts "You have chosen to search by location. Which one would you like to learn more about?"
      puts "~*~*~*~*~*~*~*~*~*~*~*~*"
      search_by_location
      location_info
      species_info
      puts "\n"
      save_to_book
    elsif select == "3" || select == "country of origin" || select == "country" || select == "origin"
      puts "You have chosen to search by the country of origin. Which one would you like to learn more about?"
      puts "~*~*~*~*~*~*~*~*~*~*~*~*"
      search_by_origin_country
      origin_info
      species_info
      puts "\n"
      save_to_book
    elsif select == "4" || select == "tail" || select == "does it have a tail?" || select == "does it have a tail" || select ==
    "tail?" || select == "tails" || select == "tails?"
      puts "You have chosen to search by if the creature has a tail. Which one would you like to learn more about?"
      puts "~*~*~*~*~*~*~*~*~*~*~*~*"
      search_by_tail
      species_info
      puts "\n"
      save_to_book
    elsif select == "5" || select == "wing" || select == "does it have wings?" || select == "does it have a wings" || select ==
    "wing?" || select == "wings" || select == "wings?" || select == "does it have wing" || select == "does it have wing?"
      puts "You have chosen to seach by if the creature has wings. Which one would you like to learn more about?"
      puts "~*~*~*~*~*~*~*~*~*~*~*~*"
      search_by_wings
      species_info
      puts "\n"
      save_to_book
    else
      puts "I'm sorry #{@user.name}, right now we dont have any searches in that category. Would you like to try again? (y/n)"
      keep_searching
    end
  end

  def search_by_species
   species = Myth.pluck(:name)
   puts species.uniq.compact
   puts "~*~*~*~*~*~*~*~*~*~*~*~*"
   puts "\n \n \n"
  end

  def search_by_location
   location = Myth.pluck(:location)
   puts location.uniq.compact
   puts "~*~*~*~*~*~*~*~*~*~*~*~*"
   puts "\n"
  end

  def search_by_origin_country
   origin_country = Myth.pluck(:origin_country)
   puts origin_country.uniq.compact
   puts "~*~*~*~*~*~*~*~*~*~*~*~*"
   puts "\n"
  end

  def search_by_tail
  species = Myth.all.map do |data|
              if data.has_tail == true
               data.name
              end
            end.uniq.compact
          puts species
          puts "~*~*~*~*~*~*~*~*~*~*~*~*"
          puts "\n"
  end

  def search_by_wings
  species = Myth.all.map do |data|
              if data.has_wings == true
               data.name
              end
            end.uniq.compact
          puts species
          puts "~*~*~*~*~*~*~*~*~*~*~*~*"
          puts "\n"
  end

  def species_info
    species = gets.chomp.capitalize
    puts "\n \n \n"
    puts "~*~*~*~*~*~*~*~*~*~*~*~*"
    @myth = Myth.all.find_by(name: "#{species}")
      if @myth
          puts @myth.name.capitalize
          puts @myth.location.capitalize
          puts @myth.origin_country.capitalize
          puts @myth.facts.capitalize
          puts "~*~*~*~*~*~*~*~*~*~*~*~*"
      else
        puts "I'm sorry that's not a known creature. Did you discover something new? (y/n)"
        answer = gets.chomp.downcase
        if answer == "y" || answer == "yes" || answer == "ok" || answer == "sure" || answer == "yeah"
          puts "Would you like to create a new entry? (y/n)?"
          response = gets.chomp.downcase
          if response == "y" || response == "yes" || response == "ok" || response == "sure" || response == "yeah"
            puts "Where is does it live? (Sky, Sea, Land)"
            location = gets.chomp.capitalize
            puts "What country did it originate from?"
            origin = gets.chomp.capitalize
            puts "Do you know any fun facts about this creature?"
            facts = gets.chomp.capitalize
            puts "Does it have a tail? (true or false?)"
            tail = gets.chomp
            tail_to_bool = wing == "true" ? true : false
            puts "Does it have wings? (true or false?)"
            wing = gets.chomp
            wing_to_bool = wing == "true" ? true : false
            @myth = Myth.find_or_create_by(name: "#{species.capitalize}", location: "#{location}", origin_country: "#{origin}", facts: "#{facts}", has_tail: tail_to_bool, has_wings: wing_to_bool)
            puts "You're all set, would you like to view your book? (y/n)"
          end
        else
          puts "Oh, ok then. Would you like to search again? (y/n)"
          keep_searching
        end
      end
  end

  def location_info
    location = gets.chomp.capitalize
    if location
      species = Myth.all.map do |data|
        if data.location == location
          data.name
        end
      end.uniq.compact
              puts "\n \n \n"
              puts "Pick one to learn more."
              puts "~*~*~*~*~*~*~*~*~*~*~*~*"
              puts species
              puts "~*~*~*~*~*~*~*~*~*~*~*~*"
    else
      puts "Sorry we currently don't know about any creatures there. "
    end
  end

  def origin_info
    origin = gets.chomp.capitalize
    if origin
      species = Myth.all.map do |data|
                  if data.origin_country == origin
                   data.name
                  end
                end.uniq.compact
              puts "\n \n \n"
              puts "Pick one to learn more."
              puts "~*~*~*~*~*~*~*~*~*~*~*~*"
              puts species
              puts "~*~*~*~*~*~*~*~*~*~*~*~*"
              puts "\n"
    else
      puts "Sorry we currently don't know about any creatures there. "
    end
  end

  # def learn_more
  # puts "Pick one to learn more."
  # end

  def save_to_book
    puts "Wow, that seems really neat. Would you like to add this creature to your book? (y/n)"
    puts "\n"
    answer = gets.chomp.downcase
    if answer == "y" || answer == "yes" || answer == "ok" || answer == "sure" || answer == "yeah"
      puts "\n \n"
      puts "Awesome!"
      @@book << @myth
      species = UserMyth.find_or_create_by(user_id: @user.id, myth_id: @myth.id)
      view_book
    else
      puts "\n \n \n"
      puts "Ok. Shall we look for something else? (y/n)"
      puts "\n \n \n"
      keep_searching
    end
  end

  def view_book
    puts "\n \n"
    puts "Your book is looking amazing! Would you like to see it so far? (y/n)"
    puts "\n"
    answer = gets.chomp.downcase
    if answer == "y" || answer == "yes" || answer == "ok" || answer == "sure" || answer == "yeah"
       @user.myths.each do |myth|
         puts "\n \n \n"
         puts "~*~*~*~*~*~*~*~*~*~*~*~*"
         # puts "Page #{@user.myths.length}"
         puts myth.name.capitalize
         puts myth.location.capitalize
         puts myth.origin_country.capitalize
         puts myth.facts.capitalize
         puts "~*~*~*~*~*~*~*~*~*~*~*~*"
      end
      puts "\n \n \n"
      puts "Looks great! Would you like to keep searching? (y/n)"
      keep_searching
    else
      puts "Sounds good. Would you like to keep searching for creatures? (y/n)"
  end
end

def keep_searching
  puts "\n \n"
  answer = gets.chomp.downcase
  puts "\n \n \n"
  if answer == "y" || answer == "yes" || answer == "ok" || answer == "sure" || answer == "yeah"
    find_a_myth
    select_a_search
  else
    puts "Have a nice day!"
  end
end

end
