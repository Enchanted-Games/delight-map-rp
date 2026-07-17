# v1.6.0

- Updated to 26.2, the pack now works with both OpenGL and Vulkan
- Added more config settings, these can be found in `assets/eg_delight_map/shaders/include/settings.glsl`

## Changes
- The nether lighting has been updated
    - In general the nether is a bit darker and reddish
    - Block lighting in the nether is now much less yellow than it is in vanilla
- Overworld block lighting is now a little smoother
- End block lighting now spreads slightly further
- The end now has block light flickering
- The darkening of block light when an end flash happens is now much more seamless. For example, it no longer suddenly changes near the end of an end flash