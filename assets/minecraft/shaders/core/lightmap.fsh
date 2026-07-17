#version 150

// Shader written by Enchanted_Games (https://enchanted.games)
// Some parts are adapted from Mojang's shader from the minecraft assets

#moj_import <eg_delight_map:settings.glsl>
#moj_import <eg_delight_map:util.glsl>
#moj_import <eg_delight_map:lightmap_uniforms.glsl>

in vec2 texCoord;

out vec4 fragColor;

vec3 getAdjustedAmbientColour() {
    vec3 multiplier = OVERWORLD_AMBIENT_MULTIPLIER;
    if(isInEnd()) {
        multiplier = END_AMBIENT_MULTIPLIER;
    } else if(isInNether()) {
        multiplier = NETHER_AMBIENT_MULTIPLIER;
    }
    return AMBIENT_COLOR * multiplier;
}

float getAdjustedBlockFactor() {
    float addition = OVERWORLD_BLOCK_FACTOR_ADD;
    if(isInEnd()) {
        addition = END_BLOCK_FACTOR_ADD;
    } else if(isInNether()) {
        addition = NETHER_BLOCK_FACTOR_ADD;
    }
    return BLOCK_FACTOR + addition;
}

vec3 getAdjustedBlockLightColour(float level) {
    if(toint(BLOCK_LIGHT_TINT) != 0xffd88c) {
        return BLOCK_LIGHT_TINT;
    }
    if(isInEnd()) {
        return END_BLOCK_LIGHT_COLOUR;
    } else if(isInNether()) {
        return NETHER_BLOCK_LIGHT_COLOUR;
    }
    return OVERWORLD_BLOCK_LIGHT_COLOUR;

}

float getCurvedSkyFactorForEndFlash() {
    return texCoord.y * texCoord.y * SKY_FACTOR * SKY_FACTOR * END_FLASH_INTENSITY;
}

float getBlockLightSpreadFactor() {
    if(isInEnd()) {
        return END_BLOCK_LIGHT_SPREAD_FACTOR;
    } else if(isInNether()) {
        return NETHER_BLOCK_LIGHT_SPREAD_FACTOR;
    }
    return OVERWORLD_BLOCK_LIGHT_SPREAD_FACTOR;
}

float getBlockBrightness(float level) {
    float curvedLevel = level / (3 - 2 * level);
    float clamped = clamp(curvedLevel - 0.05, 0, 1);
    return clamped * mix(clamped, 1, getBlockLightSpreadFactor());
}

float getSkyBrightness(float level) {
    level -= 0.3;
    float curvedLevel = (level * 3.1) / (10 - 9 * 1.3 * level);
    return clamp(curvedLevel, 0, 1);
}

float blockLightColourMixFactor(float level) {
    return (2.0 * level - 1.0) * (2.0 * level - 1.0);
}

void main() {
    float blockSkyFactorCurve = min(isInEnd() ? getCurvedSkyFactorForEndFlash() * 0.5 : 0, 0.8);
    float blockLevel = texCoord.x - min(0.1, blockSkyFactorCurve);
    float blockBrightness = getBlockBrightness(blockLevel) * getAdjustedBlockFactor();
    float skyBrightness = getSkyBrightness(texCoord.y + 0.11) * (isInEnd() ? 0 : SKY_FACTOR);
    
    vec3 blockColouredLight = mix(getAdjustedBlockLightColour(blockLevel), vec3(1.0), blockLightColourMixFactor(blockLevel)) * blockBrightness * 1.25;
    
    vec3 skyColouredLight = vec3(
        skyBrightness * (skyBrightness * skyBrightness * 0.25 + 0.75),
        skyBrightness * (skyBrightness * skyBrightness * 0.2 + 0.8),
        skyBrightness
    ) * SKY_LIGHT_COLOUR;

    vec3 color = getAdjustedAmbientColour() + skyColouredLight + blockColouredLight;

    vec3 darkenedColour = color * vec3(0.7, 0.6, 0.6);
    color = mix(color, darkenedColour, DARKEN_WORLD_FACTOR);

    // adjust for night vision effect
    if (NIGHT_VISION_FACTOR > 0.0) {
        color = mix(color, NIGHT_VISION_COLOR * 1.6, NIGHT_VISION_FACTOR);
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
    if(isInEnd()) {
        color = mix(clamp(color, vec3(0), vec3(1)), END_FLASH_COLOUR, min(getCurvedSkyFactorForEndFlash(), abs(1 - NIGHT_VISION_FACTOR)));
    }

    fragColor = vec4(color, 1);
}
