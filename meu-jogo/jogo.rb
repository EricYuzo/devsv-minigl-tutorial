require_relative 'shuriken'

class MeuJogo < GameWindow

    def initialize
        super 800, 600, false
        @sprite = GameObject.new 0, 0, 72, 72, :img1, Vector.new(-14, -14)
    end

    def draw
        clear 0xabcdef
        @sprite.draw
    end

    def update
        KB.update
        @sprite.x -= 3 if KB.key_down? Gosu::KbLeft
        @sprite.x += 3 if KB.key_down? Gosu::KbRight
        @sprite.y -= 3 if KB.key_down? Gosu::KbUp
        @sprite.y += 3 if KB.key_down? Gosu::KbDown
    end

end

MeuJogo.new.show

