-----------------------------------
-- Area: Beaucedine_Glacier
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BEAUCEDINE_GLACIER] =
{
    text =
    {
        CONQUEST_BASE                   = 0, -- Tallying conquest results...
        BEASTMEN_BANNER                 = 81, -- There is a beastmen's banner.
        ITEM_CANNOT_BE_OBTAINED         = 6564, -- You cannot obtain the item. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE      = 6566, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED                   = 6568, -- Obtained: <item>.
        GIL_OBTAINED                    = 6569, -- Obtained <number> gil.
        KEYITEM_OBTAINED                = 6571, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED                  = 6577, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY         = 6582, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET          = 7229, -- You can't fish here.
        CONQUEST                        = 7482, -- You've earned conquest points!
        YOU_CANNOT_ENTER_DYNAMIS        = 7865, -- You cannot enter Dynamis - [Dummy/San d'Oria/Bastok/Windurst/Jeuno/Beaucedine/Xarcabard/Valkurm/Buburimu/Qufim/Tavnazia] for <number> [day/days] (Vana'diel time).
        PLAYERS_HAVE_NOT_REACHED_LEVEL  = 7867, -- Players who have not reached level <number> are prohibited from entering Dynamis.
        UNUSUAL_ARRANGEMENT_OF_BRANCHES = 7877, -- There is an unusual arrangement of branches here.
        REGIME_REGISTERED               = 10746, -- New training regime registered!
    },
    mob =
    {
        GARGANTUA_PH =
        {
            [17232078] = 17232079, -- 339 -0.472 -20
        },
        KIRATA_PH    =
        {
            [17232042] = 17232044, -- 75.797 -0.335 -323.659
            [17232043] = 17232044, -- 69.336 -0.234 -276.561
        },
        NUE_PH       =
        {
            [17231969] = 17231971, -- -342.830 -100.584 168.662
            [17231970] = 17231971, -- -322.000 -100.000 116.000
        },
    },
    npc =
    {
        MIRROR_POND_J8  = 17232196,
        OVERSEER_BASE   = 17232207,
    },
}

return zones[dsp.zone.BEAUCEDINE_GLACIER]