uniform float AmbientLightFactor;
uniform float SkyFactor;
uniform float BlockFactor;
uniform int UseBrightLightmap;
uniform vec3 SkyLightColor;
uniform float NightVisionFactor;
uniform float DarknessScale;
uniform float DarkenWorldFactor;
uniform float BrightnessFactor;

#define AMBIENT_LIGHT_FACTOR AmbientLightFactor
#define SKY_FACTOR SkyFactor
#define BLOCK_FACTOR BlockFactor
#define USE_BRIGHT_LIGHTMAP UseBrightLightmap
#define NIGHT_VISION_FACTOR NightVisionFactor
#define DARKNESS_SCALE DarknessScale
#define DARKEN_WORLD_FACTOR DarkenWorldFactor
#define BRIGHTNESS_FACTOR BrightnessFactor

#define BLOCK_LIGHT_TINT OVERWORLD_BLOCK_LIGHT_COLOUR
#define SKY_LIGHT_COLOUR SkyLightColor

bool isInEnd() {
    return USE_BRIGHT_LIGHTMAP == 1;
}

bool isInNether() {
    return abs(AMBIENT_LIGHT_FACTOR - 0.1) < 0.01;
}