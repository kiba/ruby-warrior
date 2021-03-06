

class Units
  def initialize resource , screen
    @resource = resource
    @screen = screen
    @position = Position_Calculate.new()
    @units = Rubygame::Sprites::Group.new()
  end
  def set_units units
    units.each do |unit|
      case unit.to_map()
      when "s"
        sprite = UnitSprite.new(@resource.name("sludge"),unit)
      when "S"
	sprite = UnitSprite.new(@resource.name("thick_sludge"),unit)
      when "a"
	sprite = UnitSprite.new(@resource.name("archer"),unit)
      when "@"
	sprite = UnitSprite.new(@resource.name("player"),unit)
      when "C"
	sprite = UnitSprite.new(@resource.name("captive"),unit)
      end
      @units << sprite
    end
  end
  def update
    @units.each do |sprite|
      if sprite.unit.alive?
	pos = sprite.unit.position.location()
	x , y = @position.translate_into_position(pos[0],pos[1])
	sprite.rect.x = x
	sprite.rect.y = y
      else
	@units.delete(sprite)
      end
    end
  end
  def draw
    @units.draw(@screen)
  end
end
