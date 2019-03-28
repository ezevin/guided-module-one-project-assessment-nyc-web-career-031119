# def update_myths
#   prompt = "Does this information look right? (y/n)"
#   case answer_prompt(prompt)
#   when "y"
#     "Great."
#     view_book
#   when "n"
#     fixing
#   end
# end

def fixing
  puts "Which one needs fixing?".colorize(:green).underline.wrap
  puts sort_user_myths
  name = gets.chomp.capitalize
  creature = Myth.find_by(name: "#{name}")
  puts "What was wrong with it? \n 1. Name \n 2. Location \n 3. Origin Country \n 4. Facts"
  error = gets.chomp.downcase
  if error == "name" || error == "1"
    puts "Ok, what do we want to rename it?"
    new_name = gets.chomp.capitalize
    creature.update(name: creature.name, name: new_name)
    creature.save
  view_book
  elsif error == "location" || error == "2"
    puts "Ok, where does it actually live?"
    new_location = gets.chomp.capitalize
    creature.update(location: creature.location, location: new_location)
    creature.save
  keep_searching
  elsif error == "country of origin" || error == "3" || error == "country" || error == "origin"
    puts "Ok, where was it actually originally from?"
    new_origin = gets.chomp.capitalize
    creature.update(origin_country: creature.origin_country, origin_country: new_origin)
    creature.save
  keep_searching
elsif error == "facts" || error == "4" || error == "info" || error == "the facts"
    puts "Ok, what fact is correct about this creature?"
    new_fact= gets.chomp.capitalize
    creature.update(facts: creature.facts, facts: new_fact)
    creature.save
  keep_searching
  else
    puts "I'm sorry, we can't fix that. Do you want to try again?"
    case answer_prompt(prompt)
    when 'y'
    fixing
    when 'n'
      keep_searching
    end
  end
end

def whats_wrong
  puts "What is wrong".underline
  puts " 1. I want to remove an entry \n 2. I want to fix an entry"
  issue = gets.chomp.downcase
  if issue == "1" || issue == "remove an entry" || issue == "entry" || issue == "remove" || issue == "page"
    remove_entry
  elsif issue == "2" || issue == "error" || issue == "fix" || issue == "fix an error" || issue == "fix an entry"
  fixing
  else
    prompt = "Sorry I didn't catch that. Would you like to try that again."
    case answer_prompt(prompt)
    when 'y'
      whats_wrong
    when 'n'
      puts "Ok."
      keep_searching
    end
  end
end
