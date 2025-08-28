layout(std140) uniform LightmapInfo {
    float AmbientLightFactor;
    float SkyFactor;
    float BlockFactor;
    float NightVisionFactor;
    float DarknessScale;
    float DarkenWorldFactor;
    float BrightnessFactor;
    vec3 SkyLightColor;
    vec3 AmbientColor;
} lightmapInfo;

#define AMBIENT_LIGHT_FACTOR lightmapInfo.AmbientLightFactor
#define SKY_FACTOR lightmapInfo.SkyFactor
#define BLOCK_FACTOR lightmapInfo.BlockFactor
#define USE_BRIGHT_LIGHTMAP 0
#define NIGHT_VISION_FACTOR lightmapInfo.NightVisionFactor
#define DARKNESS_SCALE lightmapInfo.DarknessScale
#define DARKEN_WORLD_FACTOR lightmapInfo.DarkenWorldFactor
#define BRIGHTNESS_FACTOR lightmapInfo.BrightnessFactor
#define SKY_LIGHT_COLOUR lightmapInfo.SkyLightColor

#define HAS_END_FLASHES
#define AMBIENT_COLOR lightmapInfo.AmbientColor

bool isInEnd() {
    int skyCol = toint(SKY_LIGHT_COLOUR);
    //       25w33a-25w34b           25w35a+
    return skyCol == 0xe57fff || skyCol == 0xe533ff;
}