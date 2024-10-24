#version 450
#pragma use_vulkan_memory_model
#extension GL_EXT_scalar_block_layout : enable
#extension GL_AMD_gpu_shader_half_float: enable

layout(local_size_x = 256) in;

layout(set=0, binding = 0) buffer Output {
    float results[];
};

void main() {
    uint index = gl_GlobalInvocationID.x;

    // Simulate some work
    float value = index;

    // Branch divergence
    // if (index % 2 == 0) {
    //     value *= 2; // Branch A
    // } else {
    //     value += 1; // Branch B
    // }
    if (1 == 1) {
        value *= 2;
    } else {
        value += 1;
    }
    // Store the result
    results[index] = value;
}
