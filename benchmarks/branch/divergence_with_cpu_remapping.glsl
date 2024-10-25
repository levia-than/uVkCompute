#version 450
#pragma use_vulkan_memory_model
#extension GL_EXT_scalar_block_layout : enable
#extension GL_AMD_gpu_shader_half_float: enable

layout (local_size_x = 256) in;

layout (set = 0, binding = 1) buffer Input {
    float input_array[]; 
};

layout (set = 0, binding = 0) buffer Output {
    float results[];
};

void main() {
  uint index = gl_GlobalInvocationID.x;
  float cond = input_array[index];
  results[index] = 0;
  float op = results[index]; 

  if ( cond >= -12) {
    op = (op + 15.f);
    op = (op * op);
    op = ((op * 2.f) - 225.f);
  } else {
    op = (op * 2.f);
    op = (op + 30.f);
    op = (op * (op - 15.f));
  }

  results[index] = op;
}