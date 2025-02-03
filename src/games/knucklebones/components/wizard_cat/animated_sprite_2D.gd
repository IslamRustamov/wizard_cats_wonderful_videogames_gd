extends AnimatedSprite2D

var tween

func run_idle_tween():
	if tween:
		tween.kill()
		
	frame = 0
	
	tween = get_tree().create_tween().set_loops()
	
	tween.tween_property(self, "rotation_degrees", 45, 1) \
		.set_trans(Tween.TRANS_CUBIC) \
		.as_relative()
	tween.tween_property(self, "rotation_degrees", -45, 1) \
		.set_trans(Tween.TRANS_CUBIC) \
		.as_relative()

func run_smirk_tween():
	if tween:
		tween.kill()
	
	tween = get_tree().create_tween().set_parallel(true)
	
	if rotation_degrees >= 0:
		var needed_rotation = -abs(-25 - rotation_degrees)

		tween.tween_property(self, "rotation_degrees", needed_rotation, 0.5) \
			.set_trans(Tween.TRANS_CUBIC)

	tween.tween_property(self, "scale", Vector2.ONE, 0.1) \
		.set_trans(Tween.TRANS_CUBIC)
	tween.chain().tween_property(self, "rotation_degrees", 45, 0.5) \
		.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "scale", Vector2(1.5, 1.5), 0.5) \
		.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "frame", 1, 0.2)
	tween.chain().tween_property(self, "scale", Vector2.ONE, 1) \
		.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "rotation_degrees", -25, 1) \
		.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "frame", 0, 0.5)
	tween.chain().tween_callback(run_idle_tween)
