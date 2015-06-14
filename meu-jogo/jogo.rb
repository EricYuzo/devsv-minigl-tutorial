require_relative 'shuriken'

class MeuJogo < GameWindow

    def initialize
        super 800, 600, false
        @sprite = GameObject.new 0, 0, 72, 72, :img1, Vector.new(-14, -14)
        @state = :new
        @font = Res.font(:font1, 16)
        @btn = Button.new(350, 285, @font, 'Jogar', :btn) {
            @state = :playing
        }
        @shurikens = []
        @shuriken_prob = 0.005
    end

    def draw
        clear 0xabcdef
        if @state == :playing
            @sprite.draw
            @shurikens.each { |s| s.draw }
        else
            @btn.draw
        end
    end

    def update
        if @state == :playing
            KB.update

            if rand < @shuriken_prob
                pos = rand(4)
                x = y = dir = nil
                case pos
                    when 0 then x = 5 + rand(771); y = 605; dir = :up
                    when 1 then x = -25; y = 5 + rand(571); dir = :right
                    when 2 then x = 5 + rand(771); y = -25; dir = :down
                    else        x = 805; y = 5 + rand(571); dir = :left
                end
                speed = 2 + rand(3)
                @shurikens << Shuriken.new(x, y, dir, speed)
            end

            @sprite.x -= 3 if KB.key_down? Gosu::KbLeft
            @sprite.x += 3 if KB.key_down? Gosu::KbRight
            @sprite.y -= 3 if KB.key_down? Gosu::KbUp
            @sprite.y += 3 if KB.key_down? Gosu::KbDown

            @shurikens.each { |s| s.update }
        else
            Mouse.update
            @btn.update
        end
    end

    def needs_cursor?
        @state != :playing
    end

end

MeuJogo.new.show

