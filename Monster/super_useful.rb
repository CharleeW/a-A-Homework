# PHASE 2
def convert_to_int(str)
  begin
      Integer(str)
    rescue ArgumentError => e
      puts "Couldn't convert #{str}. Enter #{str} in digit form"
      puts "Error was: #{e.message}"
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include?(maybe_fruit)
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end

end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
    rescue
      if maybe_fruit == "coffee"
        puts "try again"
      retry
      else
        puts "I dont like that fruit, leave me alone"
      end
  end
    
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "We dont know each other like that sweetheart. We need atleast 5 years" if yrs_known < 5
    raise "Im sorry, I didnt catch your name?" if name.length <= 0
    raise "Im sorry, What was your favorite past time again?" if fav_pastime.length <= 0
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


