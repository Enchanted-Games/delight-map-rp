// Shader written by Enchanted_Games (https://enchanted.games)
// Some parts are adapted from Mojang's shader from the minecraft assets

#version 150

#moj_import <eg_delight_map:lightmap_uniforms.glsl>

in vec2 texCoord;

out vec4 fragColor;

float get_block_brightness(float level) {
    float curved_level = level / (3 - 2 * level);
    return mix(clamp(curved_level - 0.05, 0, 1), 1.0, AMBIENT_LIGHT_FACTOR);
}
float get_sky_brightness(float level) {
    level -= 0.3;
    float curved_level = (level * 3.1) / (10 - 9 * 1.3 * level);
    return mix(clamp(curved_level, 0, 1), 1.0, AMBIENT_LIGHT_FACTOR);
}

void main() {
    // always have the bottom right pixel be white to ensure gui elements look correct
    if(texCoord.x * 16 >= 15 && texCoord.y * 16 >= 15) {
        fragColor = vec4(1.0, 1.0, 1.0, 1.0);
        return; 
    }

    float block_brightness = get_block_brightness(texCoord.x) * BLOCK_FACTOR;
    float sky_brightness = get_sky_brightness(texCoord.y + 0.11) * SKY_FACTOR;
    
    vec3 block_coloured_light = vec3(
        block_brightness,
        block_brightness * (block_brightness * block_brightness * 0.39 + 0.61),
        block_brightness * (block_brightness * block_brightness * 0.88 + 0.12)
    );
    
    vec3 sky_coloured_light = vec3(
        sky_brightness * (sky_brightness * sky_brightness * 0.25 + 0.75),
        sky_brightness * (sky_brightness * sky_brightness * 0.2 + 0.8),
        sky_brightness
    ) * SKY_LIGHT_COLOUR;

    vec3 color = sky_coloured_light + block_coloured_light;
    if(USE_BRIGHT_LIGHTMAP == 1) {
        color = 0.4 + block_coloured_light;
    }

    vec3 darkened_color = color * vec3(0.7, 0.6, 0.6);
    color = mix(color, darkened_color, DARKEN_WORLD_FACTOR);

    // adjust for night vision effect
    if (NIGHT_VISION_FACTOR > 0.0) {
        color = mix(color, vec3(1), NIGHT_VISION_FACTOR);
    }
    // adjust for darkness effect
    if (DARKNESS_SCALE > 0.0) {
        color = clamp(color - vec3(DARKNESS_SCALE), 0.0, 1.0);
    }

    // adjust for brightness setting
    color += (BRIGHTNESS_FACTOR - 0.2) / 4.0;

    fragColor = vec4(color, 1);
}
