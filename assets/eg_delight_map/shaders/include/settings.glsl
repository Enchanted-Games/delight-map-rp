#ifndef EG_DELIGHT_MAP_SETTINGS
#define EG_DELIGHT_MAP_SETTINGS

// --- CONFIG STARTS HERE ---


// -- OVERWORLD SETTINGS --

// - Block light colour in The Overworld
#define OVERWORLD_BLOCK_LIGHT_COLOUR tovec(0xd89440)

// - Multiplied with the ambient light colour
#define OVERWORLD_AMBIENT_MULTIPLIER vec3(0.9)

// - Added to the block light factor
#define OVERWORLD_BLOCK_FACTOR_ADD -0.3

// - How much block light can spread
#define OVERWORLD_BLOCK_LIGHT_SPREAD_FACTOR 1.3

// - Added to the brightness video setting (0-100 range)
#define OVERWORLD_BRIGHTNESS_ADD 0


// -- NETHER SETTINGS --

// - Block light colour
#define NETHER_BLOCK_LIGHT_COLOUR tovec(0xebb99b)

// - Multiplied with the ambient light colour
#define NETHER_AMBIENT_MULTIPLIER vec3(0.9, 0.8, 0.8)

// - Added to the block light factor
#define NETHER_BLOCK_FACTOR_ADD -0.1

// - How much block light can spread
#define NETHER_BLOCK_LIGHT_SPREAD_FACTOR 1.0

// - Added to the brightness video setting (0-100 range)
#define NETHER_BRIGHTNESS_ADD 0


// -- END SETTINGS --

// - Block light colour
#define END_BLOCK_LIGHT_COLOUR tovec(0xd0dfeb)

// - Colour of end flashes
#define END_FLASH_COLOUR tovec(0xc18bf7)

// - Max brightness end flashes can be, set to 0 to disable end flashes
#define END_FLASH_INTENSITY 0.6

// - Multiplied with the ambient light colour
#define END_AMBIENT_MULTIPLIER vec3(1.25, 1.2, 1.5)

// - Added to the block light factor
#define END_BLOCK_FACTOR_ADD -0.4

// - How much block light can spread
#define END_BLOCK_LIGHT_SPREAD_FACTOR 0.3

// - Added to the brightness video setting (0-100 range)
#define END_BRIGHTNESS_ADD 0


// --- CONFIG ENDS HERE ---

#endif