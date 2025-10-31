//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 pos;

uniform vec3 light_colours[100];
uniform vec3 light_positions[100];
uniform float light_strengths[100];
uniform float light_ranges[100];
uniform int light_source_count;
uniform vec3 min_light;
uniform vec3 max_light;
uniform float posz;

void main()
{
	vec3 total_colour = vec3(0.0, 0.0, 0.0);
	
	for(int i = 0; i < light_source_count; i++)
	{
		float dist = sqrt(pow(abs(light_positions[i].x - pos.x), 2.0) + pow(abs(light_positions[i].y - pos.y), 2.0) + pow(abs(light_positions[i].z - posz), 2.0));
		if(light_ranges[i] - dist > 0.0)
		{
			float strength = min((light_ranges[i] - dist) / light_ranges[i] * light_strengths[i], 1.0);
			total_colour += light_colours[i] * strength;
		}
	}
	
	vec4 light_colour = vec4(clamp(total_colour.x, min_light.x, max_light.x), clamp(total_colour.y, min_light.y, max_light.y), clamp(total_colour.z, min_light.z, max_light.z), 1.0);
	
    gl_FragColor = light_colour * v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
