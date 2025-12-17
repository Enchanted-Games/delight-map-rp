layout(std140) uniform LightmapInfo {
    float SkyFactor;
    float BlockFactor;
    float NightVisionFactor;
    float DarknessScale;
    float BossOverlayWorldDarkeningFactor;
    float BrightnessFactor;
    vec3 BlockLightTint;
    vec3 SkyLightColor;
    vec3 AmbientColor;
    vec3 NightVisionColor;
} lightmapInfo;

#define AMBIENT_LIGHT_FACTOR 0
#define SKY_FACTOR lightmapInfo.SkyFactor
#define BLOCK_FACTOR lightmapInfo.BlockFactor
#define USE_BRIGHT_LIGHTMAP 0
#define NIGHT_VISION_FACTOR lightmapInfo.NightVisionFactor
#define DARKNESS_SCALE lightmapInfo.DarknessScale
#define DARKEN_WORLD_FACTOR lightmapInfo.BossOverlayWorldDarkeningFactor
#define BRIGHTNESS_FACTOR lightmapInfo.BrightnessFactor

#define HAS_BLOCK_LIGHT_UNIFORM
#define BLOCK_LIGHT_TINT lightmapInfo.BlockLightTint
#define SKY_LIGHT_COLOUR lightmapInfo.SkyLightColor

#define HAS_END_FLASHES
#define AMBIENT_COLOR lightmapInfo.AmbientColor

bool isInEnd() {
    return toint(SKY_LIGHT_COLOUR) == 0xac60cd;
}

bool isInNether() {
    return false;
}