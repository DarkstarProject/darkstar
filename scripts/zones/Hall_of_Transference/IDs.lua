-----------------------------------
-- Area: Hall_of_Transference
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.HALL_OF_TRANSFERENCE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NO_RESPONSE_OFFSET      = 7244, -- There is no response.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.HALL_OF_TRANSFERENCE]