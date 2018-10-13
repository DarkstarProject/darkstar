-----------------------------------
-- Area: North_Gustaberg_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.NORTH_GUSTABERG_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET  = 7354, -- You can't fish here.
        MINING_IS_POSSIBLE_HERE = 7543, -- Mining is possible here if you have <item>.
    },
    mob =
    {
        ANKABUT_PH =
        {
            [17137702] = 17137705, -- 655.828, -11.141, 526.01
        },
    },
    npc =
    {
        MINING =
        {
            17138511,
            17138512,
            17138513,
            17138514,
            17138515,
            17138516,
        },
    },
}

return zones[dsp.zone.NORTH_GUSTABERG_S]