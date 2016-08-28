require_relative 'scene_util'
require_relative 'title/director'
require_relative 'scene1/director'
require_relative 'scene1/preparation'
require_relative 'scene2/director'
require_relative 'scene2/preparation'
require_relative 'scene3/director'
require_relative 'scene3/preparation'
require_relative 'gameOver/director'
require_relative 'end/ending.rb'

Scene.add_scene(Title::Director.new,  :title)
Scene.add_scene(Preparation1::Director.new,  :preparation1)
Scene.add_scene(Scene1::Director1.new,  :scene1)
Scene.add_scene(Preparation2::Director.new,  :preparation2)
Scene.add_scene(Scene2::Director2.new,  :scene2)
Scene.add_scene(Preparation3::Director.new,  :preparation3)
Scene.add_scene(Scene3::Director3.new,  :scene3)
Scene.add_scene(GameOver::GameOver.new, :gameOver)
Scene.add_scene(Ending::Ending.new, :ending)

