-----------------------------------
-- Area: West_Sarutabaruta_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.WEST_SARUTABARUTA_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED     = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6387, -- Obtained: <item>.
        GIL_OBTAINED                = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6390, -- Obtained key item: <keyitem>.
        HARVESTING_IS_POSSIBLE_HERE = 7068, -- Harvesting is possible here if you have <item>.
        FISHING_MESSAGE_OFFSET      = 7075, -- You can't fish here.
        DOOR_OFFSET                 = 7433, -- The door is sealed shut...
    },
    mob =
    {
        RAMPONNEAU_PH = 
        {
            [17166701] = 17166705, -- 78.836 -0.109 -199.204
        },
    },
    npc =
    {
        HARVESTING =
        {
            17167162,
            17167163,
            17167164,
            17167165,
            17167166,
            17167167,
        },
    },
}

return zones[dsp.zone.WEST_SARUTABARUTA_S]