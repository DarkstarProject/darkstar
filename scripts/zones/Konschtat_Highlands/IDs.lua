-----------------------------------
-- Area: Konschtat_Highlands
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.KONSCHTAT_HIGHLANDS] =
{
    text =
    {
        NOTHING_HAPPENS              = 119,   -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED      = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6388,  -- Obtained: <item>.
        GIL_OBTAINED                 = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY      = 6402,  -- There is nothing out of the ordinary here.
        CONQUEST_BASE                = 7049,  -- Tallying conquest results...
        ALREADY_OBTAINED_TELE        = 7208,  -- You already possess the gate crystal for this telepoint.
        DIG_THROW_AWAY               = 7225,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                 = 7227,  -- You dig and you dig, but find nothing.
        SIGNPOST3                    = 7383,  -- North: Valkurm Dunes South: North Gustaberg East: Gusgen Mines, Pashhow Marshlands
        SIGNPOST2                    = 7384,  -- North: Pashhow Marshlands West: Valkurm Dunes, North Gustaberg Southeast: Gusgen Mines
        SIGNPOST_DIALOG_1            = 7385,  -- North: Valkurm Dunes South: To Gustaberg
        SIGNPOST_DIALOG_2            = 7386,  -- You see something stuck behind the signpost.
        SOMETHING_BURIED_HERE        = 7387,  -- Something has been buried here.
        TELEPOINT_HAS_BEEN_SHATTERED = 7481,  -- The telepoint has been shattered into a thousand pieces...
        PLAYER_OBTAINS_ITEM          = 7599,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM        = 7600,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM     = 7601,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP         = 7602,  -- You already possess that temporary item.
        NO_COMBINATION               = 7607,  -- You were unable to enter a combination.
        REGIME_REGISTERED            = 9785,  -- New training regime registered!
        COMMON_SENSE_SURVIVAL        = 11908, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        STRAY_MARY_PH  =
        {
            [17219791] = 17219795, -- -305.204 -11.695 -96.078
            [17219928] = 17219933, -- -293.900  33.393 342.710
        },
        RAMPAGING_RAM_PH =
        {
            [17219885] = 17219886, -- 21 40 514
            [17219987] = 17219886, -- -163.198 62.392 568.282
            [17219886] = 17219887, -- Rampaging can't spawn if Steelfleece is up
        },
        STEELFLEECE_PH =
        {
            [17219885] = 17219887, -- 21 40 514
            [17219886] = 17219887, -- 160 24 121
            [17219987] = 17219887, -- -163.198 62.392 568.282
            [17219887] = 17219886, -- Steelfleece can't spawn if Rampaging is up
        },
        FORGER         = 17219999,
        HATY           = 17220000,
        BENDIGEIT_VRAN = 17220001,
    },
    npc =
    {
        CASKET_BASE = 17220110,
    },
}

return zones[dsp.zone.KONSCHTAT_HIGHLANDS]