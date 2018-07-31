-----------------------------------
-- Area: Aydeewa_Subterrane
-----------------------------------
require("scripts/globals/zones")
-----------------------------------

zones = zones or {}

zones[dsp.zone.AYDEEWA_SUBTERRANE] =
{
    text =
    {
        NOTHING_HAPPENS         = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        FISHING_MESSAGE_OFFSET  = 7048, -- You can't fish here.
        MINING_IS_POSSIBLE_HERE = 7319, -- Mining is possible here if you have
        KEYITEM_OBTAINED        = 7321, -- Obtained key item: <keyitem>.
    },
    mob =
    {
        NOSFERATU          = 17056157,
        PANDEMONIUM_WARDEN = 17056168,
        CHIGRE             = 17056186,
    },
    npc =
    {
    },
}

return zones[dsp.zone.AYDEEWA_SUBTERRANE]