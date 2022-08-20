require 'dxruby'

require_relative 'player'
require_relative 'enemy'

font = Font.new(32)
player_img = Image.load("image/player.png")
enemy_img = Image.load("image/enemy.png")

player = Player.new(100, 100, player_img)
enemies = []
10.times do
  enemies << Enemy.new(rand(0..(640 - 32 - 1)), rand((480 - 32 - 1)), enemy_img)
end

timer = 600 + 60    

Window.loop do
    if timer >= 60
        timer -= 1
        player.update
    end
    
  player.draw

  Sprite.draw(enemies)
  Window.draw_font(10, 10, "Ayimen：#{player.score}", font)
  Window.draw_font(10, 32, "Time left：#{timer / 60}s", font)

  Sprite.check(player, enemies)
end