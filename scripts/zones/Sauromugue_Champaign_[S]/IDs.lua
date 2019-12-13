-----------------------------------
-- Area: Sauromugue_Champaign_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SAUROMUGUE_CHAMPAIGN_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        COMMON_SENSE_SURVIVAL   = 10055, -- It appears that you have arrived at a new survival guide provided by the Servicemen's Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        BALAM_QUITZ_PH =
        {
            [17178778] = 17178803, -- 481.509 24.184 98.264
        },
        COQUECIGRUE = 17178689,
    },
    npc =
    {
    },
}

return zones[dsp.zone.SAUROMUGUE_CHAMPAIGN_S]