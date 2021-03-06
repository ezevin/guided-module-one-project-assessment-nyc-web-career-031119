def update_myths
  puts "\n \n"
  puts "Which one needs fixing?".colorize(:green).underline.wrap
  puts sort_user_myths
  fix_name = gets.chomp.capitalize
  myth = Myth.pluck(:name)
  if myth.include?(fix_name)
    @myth = Myth.find_by(name: "#{fix_name}")
    puts "\n \n"
    puts "What was wrong with it?".colorize(:green).wrap
    puts " 1. Name \n 2. Location \n 3. Origin Country \n 4. Facts"
    puts "\n \n \n"
    error = gets.chomp.downcase
    if error == "name" || error == "1"
      puts "\n \n"
      puts "Ok, what do we want to rename it?".colorize(:light_cyan).wrap
      new_name = gets.chomp.capitalize
      @myth.update(name: @myth.name, name: new_name)
    view_book
    elsif error == "location" || error == "2"
      puts "\n \n"
      puts "Ok, where does it actually live?".colorize(:light_cyan).wrap
      new_location = gets.chomp.capitalize
      @myth.update(location: @myth.location, location: new_location)
    view_book
    elsif error == "country of origin" || error == "3" || error == "country" || error == "origin"
      puts "\n \n"
      puts "Ok, where was it actually originally from?".colorize(:light_cyan).wrap
      new_origin = gets.chomp.capitalize
      @myth.update(origin_country: @myth.origin_country, origin_country: new_origin)
    view_book
    elsif error == "facts" || error == "4" || error == "info" || error == "the facts"
      puts "\n \n"
      puts "Ok, what fact is correct about this creature?".colorize(:light_cyan).wrap
      new_fact= gets.chomp.capitalize
      @myth.update(facts: @myth.facts, facts: new_fact)
    view_book
    else
      puts "\n \n"
      prompt = "I'm sorry, we can't fix that. Do you want to try again?".colorize(:green).wrap
      case answer_prompt(prompt)
      when 'y'
      puts "\n \n"
      puts "Ok."
      update_myths
      when 'n'
      keep_searching
      end
    end
    refetch_myth
    view_book
  else
    puts "\n \n"
    prompt = "I'm sorry, that's not one of the creatures in your book. Would you like to try again? (y/n)"
    case answer_prompt(prompt)
    when 'y'
      update_myths
    when 'n'
      puts "\n \n"
      puts "Changed your mind?"
      keep_searching
    end
  end
end

def whats_wrong
  puts "\n \n \n"
  puts "What is wrong".colorize(:green).underline.wrap
  puts " 1. I want to remove an entry \n 2. I want to fix an entry"
  puts "\n \n \n"
  issue = gets.chomp.downcase
  if issue == "1" || issue == "remove an entry" || issue == "entry" || issue == "remove" || issue == "page"
    remove_entry
  elsif issue == "2" || issue == "error" || issue == "fix" || issue == "fix an error" || issue == "fix an entry"
  update_myths
  else
    puts "\n"
    prompt = "Sorry I didn't catch that. Would you like to try that again.".colorize(:green).wrap
    case answer_prompt(prompt)
    when 'y'
      whats_wrong
    when 'n'
      puts "Ok."
      puts "\n"
      keep_searching
    end
  end
end
