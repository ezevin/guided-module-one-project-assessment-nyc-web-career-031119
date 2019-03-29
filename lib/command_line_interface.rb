class CLI

  attr_accessor :user, :myth, :player

  def initialize
    @user = nil
    @myth = nil
    @player = player
  end

  def greet
    puts 'Welcome back Mr. Scamander.'.colorize(:green).bold.wrap
  end

  def hello
    puts "____________________________________________________".colorize(:yellow).bold
    puts"|____________________________________________________|".colorize(:yellow).bold
    puts"| __     __   ____   ___ ||  ____    ____     _  __  |".colorize(:yellow).bold
    puts"||  |__ |--|_| || |_|   |||_|**|*|__|+|+||___| ||  | |".colorize(:yellow).bold
    puts"||==|^^||--| |=||=| |=*=||| |~~|~|  |=|=|| | |~||==| |".colorize(:yellow).bold
  puts  "||  |##||  | | || | |H P|||-|  | |==|+|+||-|-|~||__| |".colorize(:yellow).bold
  puts  "||__|__||__|_|_||_|_|___|||_|__|_|__|_|_||_|_|_||__|_|".colorize(:yellow).bold
  puts  "||_______________________||__________________________|".colorize(:yellow).bold
  puts  "| _____________________  ||      __   __  _  __    _ |".colorize(:yellow).bold
  puts  "||=|=|=|=|=|=|=|=|=|=|=| __..\ / |  |_|  ||#||==|  / /|".colorize(:yellow).bold
  puts  "|| | | | | | | | | | | |/ \  \   \ \|++|=|  || ||==| / / |".colorize(:yellow).bold
  puts  "||_|_|_|_|_|_|_|_|_|_|_/_/ \_.___ \__|_|__||_||__|/_/__|".colorize(:yellow).bold
  puts  "|____________________ / \~()/()~// \ __________________|".colorize(:yellow).bold
  puts  "| __   __    _  _     \ _  (_ .  _/ _    ___     _____|".colorize(:yellow).bold
  puts  "||~~|_|..|__| || |_ _    \ // \ \ /  |=|__|~|~|___| | | |".colorize(:yellow).bold
  puts  "||--|+|^^|==|1||2| | |__/ \ __ / \__| |==|x|x|+|+|=|=|=|".colorize(:yellow).bold
  puts  "||__|_|__|__|_||_|_| /   \  \  / /   \_|__|_|_|_|_|_|_|_|".colorize(:yellow).bold
  puts  "|_________________ _/     \ /\ /\ /    \_ _______________|".colorize(:yellow).bold
  puts  "| _____   _   __  |/       \../      \ |  __   __   ___|".colorize(:yellow).bold
  puts  "||_____|_| |_|##|_||   |   \ / __|   ||_|==|_|++|_|-|||".colorize(:yellow).bold
  puts  "||______||=|#|--| | \    \   o    /   /| |  |~|  | | |||".colorize(:yellow).bold
  puts  "||______||_|_|__|_|_ \    \  o   /   /_|_|__|_|__|_|_|||".colorize(:yellow).bold
  puts  "|_________ __________ \___ \____/___/___________ ______|".colorize(:yellow).bold
  puts  "|__    _  /    ________     ______           /| _ _ _|".colorize(:yellow).bold
  puts  "| \  \  |=|/   //    /| //   /  /  / |        / ||%|%|%|".colorize(:yellow).bold
  puts  "|  \ /\ |*/  .//____//.//   /__/__/ (_)      /  ||=|=|=|".colorize(:yellow).bold
 puts "|  \ /\ |/   /(____|/ //                    /  /||~|~|~|".colorize(:yellow).bold
  puts  "|___\ _/   /________//   ________         /  / ||_|_|_|".colorize(:yellow).bold
  puts  "|___ /   (|________/   | \_______ \       /  /| |______|".colorize(:yellow).bold
  puts    "    /                  \ |________)     /  / | |".colorize(:yellow).bold
  end

  def hit_space
    space = gets.chomp.capitalize
    puts space
  end

  def who_are_you
    puts "Wait you're not Newt Scamander. Who are you?".colorize(:red).bold.wrap
    name = gets.chomp.capitalize
    @user = User.find_by(name: "#{name}")
    if @user != nil
      puts "\n \n"
      puts "Oh! Sorry #{@user.name.capitalize}! I didn't recognize you! Welcome Back.".colorize(:green).wrap
      view_book
    else
      @user = User.create(name: "#{name}")
    puts "\n \n"
    puts "Welcome #{@user.name.capitalize}!".colorize(:green).wrap
    prompt = "Ready to start creating your own book of fantastic beasts? (Y/N)".colorize(:green).wrap
    case answer_prompt(prompt)
    when 'y'
      puts "\n \n"
      puts "Great! Let's Go!".colorize(:green).wrap
    when 'n'
      puts "\n \n"
      puts "Alright, maybe next time.".colorize(:green).wrap
      exit
    end
    end
  end

  def answer_prompt(prompt)
   answer = ''
   accepted_answers = ['y', 'n']
   positive_options = ['y', 'yes', 'ok', 'sure', 'yeah', 'alright']
   negative_options = ['n', 'no', 'nope', 'nah', 'no way', 'never']
   puts prompt
   while !accepted_answers.include?(answer)
     answer = gets.chomp.downcase
     if positive_options.include?(answer)
       answer = 'y'
     elsif negative_options.include?(answer)
       answer = 'n'
     else
       puts "\n \n"
       puts "I didn't understand that. Let's try that again?".colorize(:green).wrap
       puts "\n \n"
       puts prompt
     end
   end
   answer
  end

  def find_a_myth
    puts "\n \n \n"
    puts "Where would you like to begin your search? You can search by:".colorize(:green).wrap
    puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
    puts "\s1. Species \n 2. Location \n 3. Country of Origin \n 4. Does It Have A Tail? \n 5. Does It Have Wings?".wrap
    puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
    # puts "\n \n \n"
  end

  def select_a_search
    select = gets.chomp.downcase
    puts "\n \n \n"
    if select == "1" || select == "species"
      puts "You have chosen to search by species. Which one would you like to learn more about? \n".colorize(:green).wrap
      puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
      search_by_species
      species_info
      puts "\n"
      save_to_book
    elsif select == "2" || select == "location"
      puts "You have chosen to search by location. Which one would you like to learn more about?".colorize(:green).wrap
      puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
      search_by_location
      location_info
      species_info
      puts "\n"
      save_to_book
    elsif select == "3" || select == "country of origin" || select == "country" || select == "origin"
      puts "You have chosen to search by the country of origin. Which one would you like to learn more about?".colorize(:green).wrap
      puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
      search_by_origin_country
      origin_info
      species_info
      puts "\n"
      save_to_book
    elsif select == "4" || select == "tail" || select == "does it have a tail?" || select == "does it have a tail" || select ==
    "tail?" || select == "tails" || select == "tails?"
      puts "You have chosen to search by if the creature has a tail. Which one would you like to learn more about?".colorize(:green).wrap
      puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
      search_by_tail
      species_info
      puts "\n"
      save_to_book
    elsif select == "5" || select == "wing" || select == "does it have wings?" || select == "does it have a wings" || select ==
    "wing?" || select == "wings" || select == "wings?" || select == "does it have wing" || select == "does it have wing?"
      puts "You have chosen to search by if the creature has wings. Which one would you like to learn more about?".colorize(:green).wrap
      puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
      search_by_wings
      species_info
      puts "\n"
      save_to_book
    else
      puts "I'm sorry #{@user.name}, right now we dont have any searches in that category.".colorize(:green).wrap
      keep_searching
    end
  end

  def search_by_species
     species = Myth.pluck(:name)
     puts species.uniq.compact
     puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
     puts "\n"
  end

  def search_by_location
   location = Myth.pluck(:location)
   puts location.uniq.compact
   puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
   puts "\n"
  end

  def search_by_origin_country
   origin_country = Myth.pluck(:origin_country)
   puts origin_country.uniq.compact
   puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
   puts "\n"
  end

  def search_by_tail
  species = Myth.all.map do |data|
              if data.has_tail == true
               data.name
              end
            end.uniq.compact
          puts species
          puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
          puts "\n"
  end

  def search_by_wings
  species = Myth.all.map do |data|
              if data.has_wings == true
               data.name
              end
            end.uniq.compact
          puts species
          puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
          puts "\n"
  end

  def species_info
    species = gets.chomp.capitalize
    puts "\n \n \n"
      @myth = Myth.all.find_by(name: "#{species}")
        if @myth
            puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
            puts @myth.name.capitalize
            puts "-----------".colorize(:light_blue)
            puts @myth.location.capitalize
            puts @myth.origin_country.capitalize
            puts @myth.facts.capitalize.wrap
            puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
        else
          puts "I'm sorry that's not a known creature.".colorize(:green).wrap
          prompt = "Did you discover something new? (y/n)".colorize(:green).wrap
          puts "\n"
          case answer_prompt(prompt)
          when 'y'
            create_a_new_entry
          when 'n'
            puts "\n \n \n"
            puts "Oh, ok then. Would you like to go back to exploring? (y/n)".colorize(:green).wrap
            keep_searching
          end
        end
  end

  def create_a_new_entry
    puts "\n \n"
    prompt = "Would you like to create a new entry? (y/n)?".colorize(:green).wrap
    puts "\n"
    case answer_prompt(prompt)
    when 'y'
      puts "\n \n \n"
      puts "What did you call it again?".colorize(:light_cyan).wrap
      name = gets.chomp.capitalize
      puts "\n"
      puts "Where is does it live? (Sky, Sea, Land)".colorize(:light_cyan).wrap
      location = gets.chomp.capitalize
      puts "\n"
      puts "What country did it originate from?".colorize(:light_cyan).wrap
      origin = gets.chomp.capitalize
      puts "\n"
      puts "Do you know any fun facts about this creature?".colorize(:light_cyan).wrap
      facts = gets.chomp.capitalize
      puts "\n"
      puts "Does it have a tail? (true or false?)".colorize(:light_cyan).wrap
      tail = gets.chomp.downcase
      tail_to_bool = tail == "true" || tail == "yes" || tail == "y" || tail == "t" || tail == "sure" || tail == "yeah" ? true : false
      puts "\n"
      puts "Does it have wings? (true or false?)".colorize(:light_cyan).wrap
      wing = gets.chomp.downcase
      wing_to_bool = wing == "true" || wing == "yes" || wing == "y" || wing == "t" || wing == "sure" || wing == "yeah" ? true : false
      puts "\n \n \n"
      @myth = Myth.find_or_create_by(name: "#{name}", location: "#{location}", origin_country: "#{origin}", facts: "#{facts}", has_tail: tail_to_bool, has_wings: wing_to_bool)
      puts "You just discovered a previously unknown creature.".colorize(:green).wrap
      save_to_book
    when 'n'
      puts "\n \n \n"
      puts "Don't want to share your discovery? That's ok, maybe next time. Would you like to look for a new creature? (y/n)".colorize(:green).wrap
      keep_searching
    end
  end

  def location_info
    location = gets.chomp.capitalize
    original_location = Myth.pluck(:location)
      if original_location.include?(location)
        species = Myth.all.map do |data|
          if data.location == location
            data.name
          end
        end.uniq.compact
          puts "\n \n \n"
          puts "Pick one to learn more.".colorize(:green).wrap
          puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
          puts species
          puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
      else
      puts "Sorry we currently don't know about any creatures there.".colorize(:green).wrap
      keep_searching
      end
  end


  def origin_info
    origin = gets.chomp.capitalize
    origin_country = Myth.pluck(:origin_country)
    if origin_country.include?(origin)
      species = Myth.all.map do |data|
                  if data.origin_country == origin
                   data.name
                  end
                end.uniq.compact
              puts "\n \n \n"
              puts "Pick one to learn more.".colorize(:green).wrap
              puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
              puts species
              puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
              puts "\n"
    else
      puts "Sorry we currently don't know about any creatures there.".colorize(:green).wrap
      keep_searching
    end
  end

  def save_to_book
    puts "Wow, that seems really neat.".colorize(:green).wrap
    prompt = "Would you like to add this creature to your book? (y/n)".colorize(:green).wrap
    case answer_prompt(prompt)
    when 'y'
      puts "\n \n"
      if sort_user_myths.include?(@myth.name)
        puts "I'm sorry it seems like you already have that creature in your book...but ".colorize(:green).wrap
        view_book
      else
      puts "Awesome!".colorize(:green).wrap
      puts "\n"
      puts "Let's find a place for it in your book. Beginning? Middle? End? (Beginning(1)<=>End (10)".colorize(:light_cyan).wrap
      puts "\n"
      input = gets.chomp
      page_input(input)
      end
    when 'n'
      puts "\n \n \n"
      puts "Ok.".colorize(:green).wrap
      keep_searching
    end
  end

  def page_input(input)
    # if input == [1...10]
    # input = gets.chomp.to_f
    if input == "1" || input == "2" || input == "3" || input == "4" || input == "5" || input == "6" || input == "7" || input == "8" || input == "9" || input == "10"
      UserMyth.create(user_id: @user.id, myth_id: @myth.id, rating: input)
      refetch_user
      view_book
      return
    else
      puts "\n"
      puts "I'm sorry that's not a valid page number. Lets try that again.".colorize(:green).wrap
      input = gets.chomp
      page_input(input)
    end
  end

  def view_book
    refetch_user
    puts "\n \n"
    puts "Your book is looking amazing!".colorize(:green).wrap
    prompt = "Would you like to see it so far? (y/n)".colorize(:green).wrap
    puts "\n"
    case answer_prompt(prompt)
    when 'y'
      if !@user.user_myths.empty?
          sorted =  @user.user_myths.sort do |a,b|
            a.rating <=> b.rating
          end
         sorted.each_with_index do |usermyth, index|
           # binding.pry
           puts "\n \n \n"
           puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
           puts "Page #{index + 1}"
           puts "-------".colorize(:light_red)
           puts usermyth.myth.name.capitalize.underline
           puts usermyth.myth.location.capitalize
           puts usermyth.myth.origin_country.capitalize
           puts usermyth.myth.facts.capitalize.wrap
           puts "~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:magenta)
        end
        puts "\n \n \n"
        prompt = "Does this information look right to you? (y/n)".colorize(:green).wrap
        case answer_prompt(prompt)
        when 'y'
          puts "\n \n \n"
          puts "You book is looking great!".colorize(:green).wrap
          keep_searching
        when 'n'
          whats_wrong
        end
      else
        puts "\n \n \n"
        puts "I'm sorry, it looks like you haven't entered any creatures into your book yet.".colorize(:green).wrap
        keep_searching
      end
    when 'n'
      puts "\n \n"
      puts "Sounds good.".colorize(:green).wrap
      keep_searching
  end
end

def keep_searching
  prompt = "Would you like to try exploring somewhere else? (y/n)".colorize(:green).wrap
  puts "\n \n \n"
  case answer_prompt(prompt)
  when 'y'
    find_a_myth
    select_a_search
  when 'n'
    puts "\n \n"
    puts "Alright until next time!".colorize(:green).wrap
    puts "\n \n"
    exit
  end
end

def refetch_user
  @user = User.find(@user.id)
end

def refetch_myth
  @myth = Myth.find(@myth.id)

end

def remove_entry
    puts "\n \n \n"
    puts "Which one?".colorize(:light_cyan).underline.wrap
    puts sort_user_myths
      delete_myth_name = gets.chomp.capitalize
      name = Myth.pluck(:name)
      if name.include?(delete_myth_name)
        new_myth = @user.myths.find do |myth|
          myth.name == delete_myth_name
        end
          book_entry = UserMyth.find_by(user_id: @user.id, myth_id: new_myth.id)
          UserMyth.destroy(book_entry.id)
      else
        puts "I'm sorry thats not an entry in your book.".colorize(:green).wrap
      end
    refetch_user
    view_book
end

def start_music(file)
  @player = Audite.new
  # binding.pry
  @player.load(file)
  @player.start_stream
end

def sort_user_myths
  @user.user_myths.map do |myth_id|
    myth_id.myth.name
 end
end


end
