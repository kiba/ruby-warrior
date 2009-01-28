

class Units
  def initialize resource , screen
    @resource = resource
    @screen = screen
    @position = Position_Calculate.new()
    @player = Tile.new(@resource.name("player"))
  end
  def set_player warrior
    @warrior = warrior
  end
  def update
    if @warrior.alive? == false
      return
    end
    pos = @warrior.position.location()
    x , y = @position.translate_into_position(pos[0],pos[1])
    @player.rect.x = x
    @player.rect.y = y
  end
  def draw
    @player.draw(@screen)
  end
end
