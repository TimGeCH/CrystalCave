shader_type canvas_item;

uniform float cutoff: hint_range(0.0, 1.0) = 0.5;

void fragment()
{
	vec4 col = vec4(0.0, 0.0, 0.0, 1.0);
	
	if(UV.x < cutoff){
		col.a = 0.0
	}
	
	COLOR = col;
}

