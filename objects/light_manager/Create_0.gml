u_light_colours = shader_get_uniform(light_shader, "light_colours");
u_light_positions = shader_get_uniform(light_shader, "light_positions");
u_light_strengths = shader_get_uniform(light_shader, "light_strengths");
u_light_ranges = shader_get_uniform(light_shader, "light_ranges");
u_light_source_count = shader_get_uniform(light_shader, "light_source_count");
u_min_light = shader_get_uniform(light_shader, "min_light");
u_max_light = shader_get_uniform(light_shader, "max_light");

light_colours = [];
light_positions = [];
light_strengths = [];
light_ranges = [];
light_source_count = 0;
min_light_value = 0;
max_light_value = 1;
min_light = [min_light_value, min_light_value, min_light_value];
max_light = [max_light_value, max_light_value, max_light_value];

