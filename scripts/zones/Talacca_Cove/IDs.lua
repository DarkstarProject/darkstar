-----------------------------------
-- Area: Talacca_Cove
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.TALACCA_COVE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED      = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6388, -- Obtained: <item>.
        GIL_OBTAINED                 = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6391, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET       = 7049, -- You can't fish here.
        YOU_CAN_NOW_BECOME_A_CORSAIR = 7782, -- You can now become a corsair!
    },
    mob =
    {
        GESSHO = 17010725,
    },
    npc =
    {
    },
}

return zones[dsp.zone.TALACCA_COVE]