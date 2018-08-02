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
        ITEM_CANNOT_BE_OBTAINED = 6403, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6409, -- Obtained: <item>.
        GIL_OBTAINED            = 6410, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6412, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7070, -- Tallying conquest results...
        BEASTMEN_BANNER         = 7151, -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET  = 7229, -- You can't fish here.
        DIG_THROW_AWAY          = 7242, -- You dig up ?Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?, but your inventory is full.
        FIND_NOTHING            = 7244, -- You dig and you dig, but find nothing.
        CONQUEST                = 7918, -- You've earned conquest points!
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
    },
    npc =
    {
        OVERSEER_BASE = 17224324,
    },
}

return zones[dsp.zone.PASHHOW_MARSHLANDS]