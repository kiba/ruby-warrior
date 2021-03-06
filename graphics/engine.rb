

class Engine
  attr_accessor :maps , :units , :runnable
  def initialize
    @resource = Graphic_Resource.new()
    @screen = Screen.new([800,600],0,[Rubygame::HWSURFACE,Rubygame::DOUBLEBUF])
    @maps = Maps.new(@resource,@screen)
    @units = Units.new(@resource,@screen)
  end
  def draw
    @maps.draw()
    @units.draw()
    @screen.flip()
  end
end
