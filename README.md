# Delight-map
Delight-map is a resourcepack that tweaks Minecraft's lighting to be slightly darker and a bit more realistic. The name is a play on the word "lightmap"

This pack was designed for 25-35% brightness, so it is recommended to change your brightness setting to about 30%.

## Compatibility
This pack will work in vanilla or with Sodium, with no additional mods required!

On 26.2 or above this pack works with both the vanilla OpenGL and Vulkan rendering backends.

It likely won't work with iris (shaderpacks enabled) or optifine. It is incompatible with Vulkanmod.

## What exactly does it do?
- Block light (from things like torches) is now warmer and spreads slightly less
- Sky light is a bit more blue-ish and spreads much less than it does in vanilla. This means shaded areas look darker as if they were actually in shadow
- The overall brightness has been decreased (dont worry you can still crank the brightness to 100% if you really like seeing in caves)
- Block lighting in The End is cooler and spreads less than in vanilla to fit in with the desolate vibe of the dimension
- The colour of end flashes has been adjusted to look closer to the actual flash that appears in the sky. They are also a bit less intense than vanilla and dont cause block lighting to become excessively bright
- In v1.6 and above, The Nether lighting is overall a bit darker. Block lighting is closer red instead of very yellow-ish like it is in vanilla.

## Config
As of v1.6, the pack has some config options that can be modified. To modify these, open the file `assets/eg_delight_map/shaders/include/settings.glsl` in a text editor such as notepad. There are comments in the file that explain roughly what each option does.

**Be careful, invalid formatting will make the pack fail to load!**

## License
<p xmlns:cc="http://creativecommons.org/ns#" >Delight-map by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://enchanted.games">ioblackshaw (a.k.a. Enchanted_Games)</a> is licensed under <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">CC BY-NC-SA 4.0<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/nc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1" alt=""></a></p>
Video content creators may monetise videos including this work provided the license is followed.
