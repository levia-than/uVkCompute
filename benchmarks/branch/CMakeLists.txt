uvkc_glsl_shader_instance(
  NAME
    branch_divergence_shader
  SRC
    "branch_divergence.glsl"
  GLSLC_ARGS
    "--target-env=vulkan1.1"
)

uvkc_cc_binary(
  NAME
    branch_divergence 
  SRCS
    "branch_divergence_main.cc"
  DEPS
    ::branch_divergence_shader
    benchmark::benchmark
    uvkc::benchmark::core
    uvkc::benchmark::main
)