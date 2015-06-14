require 'minigl'
include MiniGL

class MeuJogo < GameWindow

    def initialize
        super 800, 600, false
        @sprite = Sprite.new 0, 0, :img1
    end

    def draw
        clear 0xffffff
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

