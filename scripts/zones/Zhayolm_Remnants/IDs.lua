-----------------------------------
-- Area: Zhayolm_Remnants
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ZHAYOLM_REMNANTS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CELL_OFFSET             = 7212, -- Main Weapon/Sub-Weapon restriction removed.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.ZHAYOLM_REMNANTS]