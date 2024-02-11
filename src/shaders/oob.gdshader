shader_type canvas_item;

uniform sampler2D noise : repeat_enable;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 pos = SCREEN_UV
	//+ vec2(
		//0,
		//cos(SCREEN_UV.x * 200.0 + TIME * 50.0) * 0.03
		////+ texture(noise, SCREEN_UV + TIME * 1.0).b * 10.0 / 50.0
		////+ texture(noise, SCREEN_UV.yx + TIME * 1.0).b * 10.0 / 50.0
	//)
	;
	//float seed = texture(noise, vec2(pos.x + cos(TIME), TIME * 0.1));
	COLOR.a *= texture(noise,
	vec2(pos.x + cos(TIME * texture(noise, SCREEN_UV.xx).b), TIME * 0.1)
	).b + 0.5 - distance(SCREEN_UV, vec2(0.5, 0.5)) * 2.0;
}
