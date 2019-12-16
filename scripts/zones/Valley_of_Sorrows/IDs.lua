-----------------------------------
-- Area: Valley_of_Sorrows
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.VALLEY_OF_SORROWS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6386,  -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6388,  -- Obtained: <item>.
        GIL_OBTAINED               = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6391,  -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED             = 6397,  -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY    = 6402,  -- There is nothing out of the ordinary here.
        AURA_THREATENS             = 6406,  -- An aura of irrepressible might threatens to overwhelm you...
        CONQUEST_BASE              = 7049,  -- Tallying conquest results...
        SOMETHING_BURRIED          = 7308,  -- It looks like something was buried here.
        PLAYER_OBTAINS_ITEM        = 7498,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM      = 7499,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM   = 7500,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP       = 7501,  -- You already possess that temporary item.
        NO_COMBINATION             = 7506,  -- You were unable to enter a combination.
        REGIME_REGISTERED          = 9684,  -- New training regime registered!
        COMMON_SENSE_SURVIVAL      = 10803, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        ADAMANTOISE   = 17301537,
        ASPIDOCHELONE = 17301538,
    },
    npc =
    {
        CASKET_BASE    = 17301544,
        ADAMANTOISE_QM = 17301567,
    },
}

return zones[dsp.zone.VALLEY_OF_SORROWS]