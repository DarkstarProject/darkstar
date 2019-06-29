-----------------------------------
-- Area: Outer_Horutoto_Ruins
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.OUTER_HORUTOTO_RUINS] =
{
    text =
    {
        ORB_ALREADY_PLACED      = 0,     -- A dark Mana Orb is already placed here.
        CONQUEST_BASE           = 15,    -- Tallying conquest results...
        DEVICE_NOT_WORKING      = 188,   -- The device is not working.
        SYS_OVERLOAD            = 197,   -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE            = 202,   -- You lost the <item>.
        ITEM_CANNOT_BE_OBTAINED = 6587,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6593,  -- Obtained: <item>.
        GIL_OBTAINED            = 6594,  -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6596,  -- Obtained key item: <keyitem>.
        GEOMAGNETRON_ATTUNED    = 7215,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        DOOR_FIRMLY_SHUT        = 7254,  -- The door is firmly shut.
        ALL_G_ORBS_ENERGIZED    = 7257,  -- The six Mana Orbs have been successfully energized with magic!
        CHEST_UNLOCKED          = 7280,  -- You unlock the chest!
        REGIME_REGISTERED       = 10343, -- New training regime registered!
    },
    mob =
    {
        DESMODONT_PH                =
        {
            [17571868] = 17571870,
        },
        AH_PUCH_PH                  =
        {
            [17571893] = 17571903, -- -418,-1,629
            [17571894] = 17571903, -- -419,-1,570
            [17571895] = 17571903, -- -419,-1,581
            [17571896] = 17571903, -- -418,-1,590
            [17571897] = 17571903, -- -418,-1,597
            [17571898] = 17571903, -- -417,-1,640
            [17571899] = 17571903, -- -419,-1,615
            [17571900] = 17571903, -- -417,-1,661
        },
        BALLOON_NM_OFFSET           = 17572141,
        FULL_MOON_FOUNTAIN_OFFSET   = 17572197,
        JESTER_WHO_D_BE_KING_OFFSET = 17572201,
    },
    npc =
    {
        GATE_MAGICAL_GIZMO = 17572248,
        TREASURE_CHEST     = 17572290,
    },
}

return zones[dsp.zone.OUTER_HORUTOTO_RUINS]