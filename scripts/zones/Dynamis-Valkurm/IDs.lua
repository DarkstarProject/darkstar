-----------------------------------
-- Area: Dynamis-Valkurm
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DYNAMIS_VALKURM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7149, -- Tallying conquest results...
        DYNAMIS_TIME_BEGIN      = 7314, -- The sands of the <item> have begun to fall. You have <number> minutes (Earth time) remaining in Dynamis.
        DYNAMIS_TIME_EXTEND     = 7315, -- our stay in Dynamis has been extended by <number> minute[/s].
        DYNAMIS_TIME_UPDATE_1   = 7316, -- ou will be expelled from Dynamis in <number> [second/minute] (Earth time).
        DYNAMIS_TIME_UPDATE_2   = 7317, -- ou will be expelled from Dynamis in <number> [seconds/minutes] (Earth time).
        DYNAMIS_TIME_EXPIRED    = 7319, -- The sands of the hourglass have emptied...
    },
    mob =
    {
        TIME_EXTENSION =
        {
            [16937214] = {minutes = 10, ki = dsp.ki.CRIMSON_GRANULES_OF_TIME},                 -- ~80 Warchief Tombstone
            [16937239] = {minutes = 10, ki = dsp.ki.AZURE_GRANULES_OF_TIME},                   -- ~80 Adamantking Image
            [16937264] = {minutes = 10, ki = dsp.ki.AMBER_GRANULES_OF_TIME},                   -- ~80 Avatar Idol
            [16937289] = {minutes = 10, ki = dsp.ki.ALABASTER_GRANULES_OF_TIME},               -- ~80 Goblin Statue
            [16937500] = {minutes = 20, ki = dsp.ki.OBSIDIAN_GRANULES_OF_TIME, random = true}, -- ~95 Warchief Tombstone
            [16937525] = {minutes = 20, ki = dsp.ki.OBSIDIAN_GRANULES_OF_TIME, random = true}, -- ~95 Adamantking Image
            [16937550] = {minutes = 20, ki = dsp.ki.OBSIDIAN_GRANULES_OF_TIME, random = true}, -- ~95 Avatar Idol
            [16937575] = {minutes = 20, ki = dsp.ki.OBSIDIAN_GRANULES_OF_TIME, random = true}, -- ~95 Goblin Statue
        },
    },
    npc =
    {
    },
}

return zones[dsp.zone.DYNAMIS_VALKURM]
