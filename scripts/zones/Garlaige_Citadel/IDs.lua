-----------------------------------
-- Area: Garlaige_Citadel
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.GARLAIGE_CITADEL] =
{
    text =
    {
        CONQUEST_BASE               = 0, -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED     = 6540, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6546, -- Obtained: <item>.
        GIL_OBTAINED                = 6547, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6549, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY     = 6560, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING         = 6561, -- You are suddenly overcome with a sense of foreboding...
        DEVICE_NOT_WORKING          = 7232, -- The device is not working.
        SYS_OVERLOAD                = 7241, -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE                = 7246, -- You lost the <item>.
        A_GATE_OF_STURDY_STEEL      = 7270, -- A gate of sturdy steel.
        OPEN_WITH_THE_RIGHT_KEY     = 7276, -- You might be able to open it with the right key.
        BANISHING_GATES             = 7285, -- The first banishing gate begins to open...
        BANISHING_GATES_CLOSING     = 7288, -- The first banishing gate starts to close.
        YOU_FIND_NOTHING            = 7292, -- You find nothing special.
        PRESENCE_FROM_CEILING       = 7294, -- You sense a presence from in the ceiling.
        HEAT_FROM_CEILING           = 7295, -- You feel a terrible heat from the ceiling.
        CHEST_UNLOCKED              = 7324, -- You unlock the chest!
        REGIME_REGISTERED           = 9603, -- New training regime registered!
    },
    mob =
    {
        HOVERING_HOTPOT_PH =
        {
            [17596623] = 17596628, -- 182.157 -0.012 29.941
            [17596625] = 17596628, -- 188.229 -0.018 20.151
        },
        OLD_TWO_WINGS      = 17596506,
        SKEWER_SAM         = 17596507,
        CHANDELIER         = 17596533,
        GUARDIAN_STATUE    = 17596643,
        SERKET             = 17596720,
        MIMIC              = 17596728,
    },
    npc =
    {
        BANISHING_GATE_OFFSET = 17596761,
        TREASURE_CHEST        = 17596812,
        TREASURE_COFFER       = 17596813,
        CHANDELIER_QM         = 17596830,
    },
}

return zones[dsp.zone.GARLAIGE_CITADEL]