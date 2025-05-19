layout(std140) uniform LightmapInfo {
    float AmbientLightFactor;
    float SkyFactor;
    float BlockFactor;
    int UseBrightLightmap;
    float NightVisionFactor;
    float DarknessScale;
    float DarkenWorldFactor;
    float BrightnessFactor;
    vec3 SkyLightColor;
} lightmapInfo;

#define AMBIENT_LIGHT_FACTOR lightmapInfo.AmbientLightFactor
#define SKY_FACTOR lightmapInfo.SkyFactor
#define BLOCK_FACTOR lightmapInfo.BlockFactor
#define USE_BRIGHT_LIGHTMAP lightmapInfo.UseBrightLightmap
#define NIGHT_VISION_FACTOR lightmapInfo.NightVisionFactor
#define DARKNESS_SCALE lightmapInfo.DarknessScale
#define DARKEN_WORLD_FACTOR lightmapInfo.DarkenWorldFactor
#define BRIGHTNESS_FACTOR lightmapInfo.BrightnessFactor
#define SKY_LIGHT_COLOUR lightmapInfo.SkyLightColor