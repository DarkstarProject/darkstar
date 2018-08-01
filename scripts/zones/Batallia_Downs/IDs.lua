-----------------------------------
-- Area: Batallia_Downs
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BATALLIA_DOWNS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6403, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6409, -- Obtained: <item>.
        GIL_OBTAINED            = 6410, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6412, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6423, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7070, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7229, -- You can't fish here.
        DIG_THROW_AWAY          = 7242, -- You dig up$, but your inventory is full. You regretfully throw the # away.
        FIND_NOTHING            = 7244, -- You dig and you dig, but find nothing.
        NOTHING_HAPPENS         = 7329, -- Nothing happens...
    },
    mob =
    {
        TOTTERING_TOBY_PH = 
        {
            [17207449] = 17207476, -- -194.234 -18.485 132.208
        },
        AHTU              = 17207657,
        STURMTIGER        = 17207696,
        SUPARNA           = 17207697,
        SUPARNA_FLEDGLING = 17207698,
        VEGNIX_GREENTHUMB = 17207710,
    },
    npc =
    {
    },
}

return zones[dsp.zone.BATALLIA_DOWNS]