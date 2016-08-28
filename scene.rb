class Scene
  @@scenes = {}

  @@current_scene_name = nil

  def self.add_scene(scene_obj, scene_name)
    @@scenes[scene_name.to_sym] = scene_obj
  end


  def self.set_current_scene(scene_name)
    @@current_scene_name = scene_name.to_sym
  end

  def self.get_current_scene
	@@current_scene_name
  end


  def self.play_scene
	if @@current_scene_name == :ending
		 @@scenes[:ending].score = @@scenes[:scene3].hero[0].score
         @@scenes[:ending].play
		 return
	end
    @@scenes[@@current_scene_name].play
  end
end