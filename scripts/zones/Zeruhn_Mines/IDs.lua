-----------------------------------
-- Area: Zeruhn_Mines
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ZERUHN_MINES] =
{
    text =
    {
        CONQUEST_BASE           = 0,    -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED = 6541, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6547, -- Obtained: <item>.
        GIL_OBTAINED            = 6548, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6550, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET  = 7208, -- You can't fish here.
        MAKARIM_DIALOG_I        = 7315, -- Be careful on your way out. Remember, you should give my report to Naji, one of the Mythril Musketeers on post at the President's Office.
        ZELMAN_CANT_RUN_AROUND  = 7340, -- I can't run around doing everything she tells me to--I have my dignity to uphold!
        MINING_IS_POSSIBLE_HERE = 7347, -- Mining is possible here if you have <item>.
        REGIME_REGISTERED       = 9490, -- New training regime registered!
    },
    mob =
    {
    },
    npc =
    {
        MINING =
        {
            17481838,
            17481839,
            17481840,
            17481841,
            17481842,
            17481843,
        },
    },
}

return zones[dsp.zone.ZERUHN_MINES]