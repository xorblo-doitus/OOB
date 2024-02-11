shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
	if (VERTEX.y == 0.0) {
		VERTEX.y += cos(TIME * 3.0 + UV.x) * 2.0 - 10.0;
	}
}

void fragment() {
	//COLOR *= cos(TIME) + 0.5;
}
//
//void light() {
	//// Called for every pixel for every light affecting the CanvasItem.
//}
