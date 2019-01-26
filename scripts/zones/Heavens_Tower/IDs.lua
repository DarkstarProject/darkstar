-----------------------------------
-- Area: Heavens_Tower
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.HEAVENS_TOWER] =
{
    text =
    {
        STAIRWAY_LOCKED         = 554, -- The door to the Starway Stairway is locked tight.
        STAIRWAY_ONLY_CITIZENS  = 555, -- The door to the Starway Stairway is locked tight, and only citizens of Windurst can open it.
        CONQUEST_BASE           = 582, -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED = 7123, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 7129, -- Obtained: <item>.
        GIL_OBTAINED            = 7130, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 7132, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET  = 7366, -- You can't fish here.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.HEAVENS_TOWER]