#version 450
#pragma use_vulkan_memory_model
#extension GL_EXT_scalar_block_layout : enable
#extension GL_AMD_gpu_shader_half_float: enable

layout (local_size_x = 1024) in;

layout (set = 0, binding = 1) buffer Input {
    float input_array[]; 
} inputA;

layout (set = 0, binding = 0) buffer Output {
    float results[];
} outputA;

float rand(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
	uint index = gl_GlobalInvocationID.x;

  float cond = inputA.input_array[index];
	outputA.results[index] = 0;
  float op = outputA.results[index]; 

  vec2 seed = vec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y);


  if ( cond >= -12) {
    op = rand(seed);
  } else {
    op = rand(seed * 1.3) + 0.14;
  }

  outputA.results[index] = op;
}
