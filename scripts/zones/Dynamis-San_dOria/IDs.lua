-----------------------------------
-- Area: Dynamis-San_dOria
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DYNAMIS_SAN_DORIA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7055, -- Tallying conquest results...
        DYNAMIS_TIME_BEGIN      = 7214, -- The sands of the <item> have begun to fall. You have <number> minutes (Earth time) remaining in Dynamis.
        DYNAMIS_TIME_EXTEND     = 7215, -- our stay in Dynamis has been extended by <number> minute[/s].
        DYNAMIS_TIME_UPDATE_1   = 7216, -- ou will be expelled from Dynamis in <number> [second/minute] (Earth time).
        DYNAMIS_TIME_UPDATE_2   = 7217, -- ou will be expelled from Dynamis in <number> [seconds/minutes] (Earth time).
        DYNAMIS_TIME_EXPIRED    = 7219, -- The sands of the hourglass have emptied...
    },
    mob =
    {
        TIME_EXTENSION =
        {
            [17535026] = {minutes = 10, ki = dsp.ki.CRIMSON_GRANULES_OF_TIME},   -- Warchief Tombstone
            [17535057] = {minutes = 10, ki = dsp.ki.AZURE_GRANULES_OF_TIME},     -- Warchief Tombstone
            [17535128] = {minutes = 15, ki = dsp.ki.OBSIDIAN_GRANULES_OF_TIME},  -- Warchief Tombstone
            [17535131] = {minutes = 15, ki = dsp.ki.ALABASTER_GRANULES_OF_TIME}, -- Warchief Tombstone
            [17535139] = {minutes = 10, ki = dsp.ki.AMBER_GRANULES_OF_TIME},     -- Warchief Tombstone
        },
    },
    npc =
    {
    },
}

return zones[dsp.zone.DYNAMIS_SAN_DORIA]