-----------------------------------
-- Area: Qufim_Island
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.QUFIM_ISLAND] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED        = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                  = 6388, -- Obtained: <item>.
        GIL_OBTAINED                   = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY        = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE                  = 7049, -- Tallying conquest results...
        BEASTMEN_BANNER                = 7130, -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET         = 7208, -- You can't fish here.
        THESE_WITHERED_FLOWERS         = 7328, -- These withered flowers seem unable to bloom.
        NOW_THAT_NIGHT_HAS_FALLEN      = 7329, -- Now that night has fallen, the flowers bloom with a strange glow.
        CONQUEST                       = 7377, -- You've earned conquest points!
        AN_EMPTY_LIGHT_SWIRLS          = 7739, -- An empty light swirls about the cave, eating away at the surroundings...
        GIGANTIC_FOOTPRINT             = 7823, -- There is a gigantic footprint here.
        MYSTERIOUS_VOICE               = 7837, -- You hear a mysterious, floating voice: Bring forth the <item>...
        YOU_CANNOT_ENTER_DYNAMIS       = 7849, -- You cannot enter Dynamis - [Dummy/San d'Oria/Bastok/Windurst/Jeuno/Beaucedine/Xarcabard/Valkurm/Buburimu/Qufim/Tavnazia] for <number> [day/days] (Vana'diel time).
        PLAYERS_HAVE_NOT_REACHED_LEVEL = 7851, -- Players who have not reached level <number> are prohibited from entering Dynamis.
        HOMEPOINT_SET                  = 12695, -- Home point set!
        REGIME_REGISTERED              = 10331, -- New training regime registered!
    },
    mob =
    {
    },
    npc =
    {
        OVERSEER_BASE = 17293714,
    },
}

return zones[dsp.zone.QUFIM_ISLAND]