//shader_type spatial;
//
//uniform float size = 0.4;
//uniform float intensity = 0.7;
//uniform float frame_time = 0.17;
//
//uniform vec3 light_direction = vec3(-0.483, 0.866, -0.129);
//
//uniform sampler2D hatch;
//uniform vec3 color: source_color;
//uniform float hatch_size = 1.0;
//
//void vertex() {
//
//}
//
//
//
//void fragment() {
	//
	//float rounded_time = round(TIME / frame_time) * frame_time;
	//
	//mat3 view_to_world_normal_mat = mat3(
		//INV_VIEW_MATRIX[0].xyz,
		//INV_VIEW_MATRIX[1].xyz,
		//INV_VIEW_MATRIX[2].xyz
	//);
	//
	//float NdotL = dot(view_to_world_normal_mat * NORMAL , light_direction);
	//float mask = 1.0;
	//if (NdotL < 0.5) {
		//mask *= texture(hatch, UV * hatch_size + rounded_time).r * 2.0 - 1.0; 
		//mask = clamp(mask, 0.0, 1.0);
	//} 
	//if (NdotL < 0.1) {
		//mask *= texture(hatch, vec2(UV.x, -UV.y) * hatch_size + rounded_time).r * 2.0 - 1.0;
		//mask = clamp(mask, 0.0, 1.0); 
	//} 
	//ALBEDO = mix(vec3(0.0), color, mask);
//}
