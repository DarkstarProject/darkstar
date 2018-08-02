-----------------------------------
-- Area: Valkurm_Dunes
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.VALKURM_DUNES] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED        = 6403, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                  = 6409, -- Obtained: <item>.
        GIL_OBTAINED                   = 6410, -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6412, -- Obtained key item: <keyitem>.
        CONQUEST_BASE                  = 7070, -- Tallying conquest results...
        BEASTMEN_BANNER                = 7151, -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET         = 7229, -- You can't fish here.
        DIG_THROW_AWAY                 = 7242, -- You dig up ?Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?, but your inventory is full.
        FIND_NOTHING                   = 7244, -- You dig and you dig, but find nothing.?Prompt?
        SONG_RUNES_DEFAULT             = 7329, -- Lyrics on the old monument sing the story of lovers torn apart.
        UNLOCK_BARD                    = 7350, -- You can now become a bard!
        SIGNPOST2                      = 7358, -- Northeast: La Theine Plateau Southeast: Konschtat Highlands West: Selbina
        SIGNPOST1                      = 7359, -- Northeast: La Theine Plateau Southeast: Konschtat Highlands Southwest: Selbina
        CONQUEST                       = 7369, -- You've earned conquest points!
        NOTHING_HAPPENS                = 7716, -- Nothing happens...
        NOTHING_OUT_OF_ORDINARY        = 7733, -- There is nothing out of the ordinary here.
        AN_EMPTY_LIGHT_SWIRLS          = 7750, -- An empty light swirls about the cave, eating away at the surroundings..
        MONSTERS_KILLED_ADVENTURERS    = 7826, -- Long ago, monsters killed many adventurers and merchants just off the coast here. If you find any vestige of the victims and return it to the sea, perhaps it would appease the spirits of the dead.
        MYSTERIOUS_VOICE               = 7852, -- You hear a mysterious, floating voice: Bring forth the
        YOU_CANNOT_ENTER_DYNAMIS       = 7864, -- You cannot enter Dynamis
        PLAYERS_HAVE_NOT_REACHED_LEVEL = 7866, -- Players who have not reached levelare prohibited from entering Dynamis.
    },
    mob =
    {
        VALKURM_EMPEROR_PH = 
        {
            [17199434] = 17199438, -- -228.957 2.776 -101.226
            [17199437] = 17199438, -- -264.829 -0.843 -91.306
            [17199420] = 17199438, -- -95.250 -0.268 -49.386
            [17199419] = 17199438, -- -144.284 -1.103 4.202
            [17199435] = 17199438, -- -270.823 -2.168 -16.349
            [17199436] = 17199438, -- -327.000 -1.000 -21.000
        },
        GOLDEN_BAT_PH      = 
        {
            [17199562] = 17199564, -- -804.502 -8.567 22.082
            [17199563] = 17199564, -- -798.674 -8.672 19.204
            [17199461] = 17199564, -- -296.679 -0.510 -164.298
        },
        MARCHELUTE         = 17199566,
        DOMAN              = 17199567,
        ONRYO              = 17199568,
    },
    npc =
    {
        VALKURM_SUNSAND_QM = 17199697,
        OVERSEER_BASE      = 17199707,
    },
}

return zones[dsp.zone.VALKURM_DUNES]