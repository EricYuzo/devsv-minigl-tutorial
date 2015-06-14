require 'minigl'
include MiniGL

class Shuriken < GameObject

    def initialize(x, y, direction, speed)
        super x, y, 20, 20, :shuriken, Vector.new(-5, -5), 2, 2
        case direction
            when :up    then @aim = Vector.new(@x, @y - 630)
            when :right then @aim = Vector.new(@x + 830, @y)
            when :down  then @aim = Vector.new(@x, @y + 630)
            when :left  then @aim = Vector.new(@x - 830, @y)
        end
        @speed_m = speed
    end

    def update
        move_free @aim, @speed_m
        animate [0, 1, 2, 3], 4
    end

end

