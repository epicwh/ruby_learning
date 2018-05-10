require_relative 'field.rb'

P1f = Field.new(name: "Field 1")#player 1 field
P2f = Field.new(name: "Field 2")#player 1 field
loop do
  puts "Choose an option:"
  puts "- ship - to build a ship"
  puts "- shot - to make a shot"
  puts "- exit - to exit the programm"
  print "your answer: "
  answer = gets.chomp
  case answer
  when "ship"
    loop do
      print "Enter the ship length(from 1 to 4): "
      length = gets.chomp
      check = /[1-4]/=~length
      if check == 0
        length = length.to_i
        type = P1f.ship_type[length-1]
        if P1f.ship_amount[type] <= 0
          puts "Maximum ships of chosen length!!!"
        else
          P1f.build_ship(length)
          puts P1f.coordinates
          P1f.ship_amount[type] -= 1
          break
        end
      else
        puts "Wrong input!!!"
      end#if
    end#loop
  when "shot"
    puts "Shot!"
  when "exit"
    exit
  else
    puts "Unknown command!!!"
  end#case
end
