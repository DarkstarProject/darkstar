-----------------------------------
-- Area: Lower_Delkfutts_Tower
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.LOWER_DELKFUTTS_TOWER] =
{
    text =
    {
        CONQUEST_BASE                    = 0, -- Tallying conquest results...
        THE_DOOR_IS_FIRMLY_SHUT_OPEN_KEY = 159, -- The door is firmly shut. You might be able to open it if you had the key.
        DOOR_FIRMLY_SHUT                 = 160, -- The door is firmly shut.
        ITEM_CANNOT_BE_OBTAINED          = 6571, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                    = 6577, -- Obtained: <item>.
        GIL_OBTAINED                     = 6578, -- Obtained <number> gil.
        KEYITEM_OBTAINED                 = 6580, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET           = 7238, -- You can't fish here.
        REGIME_REGISTERED                = 10707, -- New training regime registered!
    },
    mob =
    {
        HIPPOLYTOS_PH =
        {
            [17531000] = 17530999, -- 337.079 -16.1 17.386
            [17531002] = 17530999, -- 346.244 -16.126 10.373
        },
        EPIALTES_PH   =
        {
            [17530882] = 17530881, -- 432.952 -0.350 -3.719
            [17530887] = 17530881, -- 484.735 0.046 23.048
        },
        EURYMEDON_PH  =
        {
            [17531118] = 17531114, -- 397.252 -32.128 -32.807
        },
        DISASTER_IDOL = 17531121,
    },
    npc =
    {
    },
}

return zones[dsp.zone.LOWER_DELKFUTTS_TOWER]