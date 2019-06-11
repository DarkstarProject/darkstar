-----------------------------------
-- Area: Pashhow_Marshlands
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.PASHHOW_MARSHLANDS] =
{
    text =
    {
        NOTHING_HAPPENS         = 141, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED = 6404, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6410, -- Obtained: <item>.
        GIL_OBTAINED            = 6411, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6413, -- Obtained key item: <keyitem>.
        KEYITEM_LOST            = 6414, -- Lost key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6424, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7071, -- Tallying conquest results...
        BEASTMEN_BANNER         = 7152, -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET  = 7230, -- You can't fish here.
        DIG_THROW_AWAY          = 7243, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING            = 7245, -- You dig and you dig, but find nothing.
        CONQUEST                = 7919, -- You've earned conquest points!
        REGIME_REGISTERED       = 10711, -- New training regime registered!
    },
    mob =
    {
        NI_ZHO_BLADEBENDER_PH =
        {
            [17223740] = 17223797, -- -429.953 24.5 -305.450
            [17223789] = 17223797, -- 11.309 23.904 -337.923
        },
        JOLLY_GREEN_PH        =
        {
            [17223888] = 17223889, -- 184.993 24.499 -41.790
        },
        BLOODPOOL_VORAX_PH    =
        {
            [17224014] = 17224019, -- -351.884 24.014 513.531
        },
        BOWHO_WARMONGER       = 17224104,
    },
    npc =
    {
        OVERSEER_BASE = 17224325,
    },
}

return zones[dsp.zone.PASHHOW_MARSHLANDS]