-----------------------------------
-- Area: Ghelsba_Outpost
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.GHELSBA_OUTPOST] =
{
    text =
    {
        CONQUEST_BASE                    = 0, -- Tallying conquest results...
        YOU_CANNOT_ENTER_THE_BATTLEFIELD = 161, -- You cannot enter the battlefield at present. Please wait a little longer.
        ITEM_CANNOT_BE_OBTAINED          = 6911, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                    = 6917, -- Obtained: <item>.
        GIL_OBTAINED                     = 6918, -- Obtained <number> gil.
        KEYITEM_OBTAINED                 = 6920, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET           = 7578, -- You can't fish here.
        LOGGING_IS_POSSIBLE_HERE         = 7739, -- Logging is possible here if you have <item>.
        YOU_CAN_NOW_BECOME_A_DRAGOON     = 7779, -- You can now become a dragoon!
    },
    mob =
    {
        THOUSANDARM_DESHGLESH_PH = 
        {
            [17350825] = 17350826, -- 123.357 -0.102 332.706
            [17350818] = 17350826, -- 94.576 -1.274 333.168
            [17350819] = 17350826, -- 98.658 -0.319 328.269
            [17350820] = 17350826, -- 96.763 -0.047 319.781
            [17350821] = 17350826, -- 85.215 -0.739 344.257
            [17350817] = 17350826, -- 80.000 -0.249 328.000
            [17350806] = 17350826, -- 75.988 -0.084 382.437
            [17350824] = 17350826, -- 82.000 -0.500 366.000
        },
    },
    npc =
    {
        LOGGING =
        {
            17350974,
            17350975,
            17350976,
            17350977,
        },
    },
}

return zones[dsp.zone.GHELSBA_OUTPOST]