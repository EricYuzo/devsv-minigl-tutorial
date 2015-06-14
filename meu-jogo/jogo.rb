require_relative 'shuriken'

class MeuJogo < GameWindow

    def initialize
        super 800, 600, false
        @sprite = GameObject.new 0, 0, 72, 72, :img1, Vector.new(-14, -14)
        @state = :new
    end

    def draw
        clear 0xabcdef
        if @state == :playing
            @sprite.draw
        end
    end

    def update
        if @state == :playing
            KB.update
            @sprite.x -= 3 if KB.key_down? Gosu::KbLeft
            @sprite.x += 3 if KB.key_down? Gosu::KbRight
            @sprite.y -= 3 if KB.key_down? Gosu::KbUp
            @sprite.y += 3 if KB.key_down? Gosu::KbDown
        end
    end

end

MeuJogo.new.show

