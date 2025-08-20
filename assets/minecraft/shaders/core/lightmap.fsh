// Shader written by Enchanted_Games (https://enchanted.games)
// Some parts are adapted from Mojang's shader from the minecraft assets

#version 150

#moj_import <eg_delight_map:settings.glsl>
#moj_import <eg_delight_map:util.glsl>
#moj_import <eg_delight_map:lightmap_uniforms.glsl>

in vec2 texCoord;

out vec4 fragColor;


float getAdjustedAmbientLightFactor() {
    return
#ifdef HAS_END_FLASHES
    isInEnd() ? 0 : AMBIENT_LIGHT_FACTOR;
#else
    AMBIENT_LIGHT_FACTOR;
#endif
}

float getAdjustedBlockFactor() {
    if(isInEnd()) {
        return (BLOCK_FACTOR / 2) + 0.7;
    }
    return BLOCK_FACTOR;
}

float getCurvedSkyFactorForEndFlash() {
#ifdef HAS_END_FLASHES
    return texCoord.y * texCoord.y * SKY_FACTOR * SKY_FACTOR;
#else
    return 0.0;
#endif
}


float getBlockBrightness(float level) {
    float curvedLevel = level / (3 - 2 * level);
    return mix(clamp(curvedLevel - 0.05, 0, 1), 1.0, getAdjustedAmbientLightFactor());
}

float getSkyBrightness(float level) {
    level -= 0.3;
    float curvedLevel = (level * 3.1) / (10 - 9 * 1.3 * level);
    return mix(clamp(curvedLevel, 0, 1), 1.0, getAdjustedAmbientLightFactor());
}


void main() {
    // always have the bottom right pixel be white to ensure gui elements look correct
    if(texCoord.x * 16 >= 15 && texCoord.y * 16 >= 15) {
        fragColor = vec4(1.0, 1.0, 1.0, 1.0);
        return; 
    }

    float blockBrightness = getBlockBrightness(texCoord.x - min(0.1, isInEnd() ? getCurvedSkyFactorForEndFlash() * 0.85 : 0)) * getAdjustedBlockFactor();
    float skyBrightness = getSkyBrightness(texCoord.y + 0.11) * SKY_FACTOR;
    
    vec3 blockColouredLight;
    if(isInEnd()) {
        float adjustedBlockBrightness = clamp(blockBrightness - 0.2, 0.05, 0.7);
        blockColouredLight = vec3(
            adjustedBlockBrightness * (adjustedBlockBrightness * adjustedBlockBrightness * 0.2 + 0.8) - 0.03,
            adjustedBlockBrightness * (adjustedBlockBrightness * 0.2 + 0.8),
            adjustedBlockBrightness
        );
    } else {
        blockColouredLight = vec3(
            blockBrightness,
            blockBrightness * (blockBrightness * blockBrightness * 0.39 + 0.61),
            blockBrightness * (blockBrightness * blockBrightness * 0.88 + 0.12)
        );
    }
    
    vec3 skyColouredLight = vec3(
        skyBrightness * (skyBrightness * skyBrightness * 0.25 + 0.75),
        skyBrightness * (skyBrightness * skyBrightness * 0.2 + 0.8),
        skyBrightness
    ) * SKY_LIGHT_COLOUR;

    vec3 color = skyColouredLight + blockColouredLight;

    if(
    #ifdef HAS_END_FLASHES
        isInEnd()
    #else
        USE_BRIGHT_LIGHTMAP == 1
    #endif
    ) {
        color = 0.4 + blockColouredLight;
    }

    vec3 darkenedColour = color * vec3(0.7, 0.6, 0.6);
    color = mix(color, darkenedColour, DARKEN_WORLD_FACTOR);

    // adjust for night vision effect
    if (NIGHT_VISION_FACTOR > 0.0) {
        color = mix(color, vec3(1), NIGHT_VISION_FACTOR);
    }
    // adjust for darkness effect
    if (DARKNESS_SCALE > 0.0) {
        color = clamp(color - vec3(min(0.9, DARKNESS_SCALE)), 0.0, 1.0);
    }

    // adjust for brightness setting
    if(isInEnd()) {
        color += (BRIGHTNESS_FACTOR * (BRIGHTNESS_FACTOR / 1.7) - 0.3) / 4.0;
    } else {
        color += (BRIGHTNESS_FACTOR - 0.2) / 4.0;
    }

    // mix end flash colour for end flashes if in the end
#ifdef HAS_END_FLASHES
    if(isInEnd()) {
        color = mix(color, END_FLASH_COLOUR, min(getCurvedSkyFactorForEndFlash(), abs(1 - NIGHT_VISION_FACTOR)));
    }
#endif

    fragColor = vec4(color, 1);
}
