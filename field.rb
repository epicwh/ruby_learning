class Field
  attr_accessor :coordinates, :ship_type, :ship_amount, :name
  def initialize(name)
    @name = name
    @coordinates = Hash.new
    @ship_type = ["small", "medium", "big", "very big"]
    @ship_amount = Hash["small", 4, "medium", 3, "big", 2, "very big", 1]
    for letter in 'a'..'j'
      for number in 1..10
        #bool_1 - ship(true) or empty field(false), bool_2 - has already been shot(true) or not(false)
        @coordinates[[letter,number]] = [false,false]#define all the coordinates on the field
      end
    end
  end
  #def build_ship_field

  #end
  #def point_allowed_field

  #end
  #def point_restricted_field

  #end
  def coordinates
    @coordinates
  end
  def ship_type
    @ship_type
  end
  def ship_amount
    @ship_amount
  end
  def build_ship(length)
    for $i in 1..length #последовательный запрос на добавление точек в формате: буква, число
      loop do
        print "Enter ship coordinate №#{$i+1}(letter, number): "
        ship_coordinate = gets.chomp
        if ship_coordinate.include?(',')#проверка, соответствуют ли введенные данные требованиям(запятая)
          x, y = ship_coordinate.split(',')
          if ('a'..'j').include?(x) and y == y.to_i.to_s and (1..10).include?(y.to_i)#проверка, лежат ли в заданных пределах указанные точки
            if @coordinates[[x,y.to_i]][0] == true#проверка, есть ли уже корабль в данной точке
              puts "There is a ship in this point!!! Please type another coordinate!!!"
            else
              @coordinates[[x,y.to_i]][0] = true
              break
            end
          else
            puts "Wrong input! X-axis from 'a' to 'j' and Y-axis from 1 to 10 integer!!!"
          end#if ('a'..'j').include?....
        else
          puts "Wrong input! X-axis and Y-axis data has to be devided by a comma!!!"
        end#if ship_coordinate.include?(',')....
      end# loop do....
    end
  end#def....
end
