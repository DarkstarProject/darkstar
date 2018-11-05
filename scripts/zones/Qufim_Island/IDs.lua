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
        ITEM_CANNOT_BE_OBTAINED        = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                  = 6387, -- Obtained: <item>.
        GIL_OBTAINED                   = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY        = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE                  = 7048, -- Tallying conquest results...
        BEASTMEN_BANNER                = 7129, -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET         = 7207, -- You can't fish here.
        THESE_WITHERED_FLOWERS         = 7327, -- These withered flowers seem unable to bloom.
        NOW_THAT_NIGHT_HAS_FALLEN      = 7328, -- Now that night has fallen, the flowers bloom with a strange glow.
        CONQUEST                       = 7376, -- You've earned conquest points!
        AN_EMPTY_LIGHT_SWIRLS          = 7738, -- An empty light swirls about the cave, eating away at the surroundings...
        GIGANTIC_FOOTPRINT             = 7822, -- There is a gigantic footprint here.
        MYSTERIOUS_VOICE               = 7836, -- You hear a mysterious, floating voice: Bring forth the <item>...
        YOU_CANNOT_ENTER_DYNAMIS       = 7848, -- You cannot enter Dynamis - [Dummy/San d'Oria/Bastok/Windurst/Jeuno/Beaucedine/Xarcabard/Valkurm/Buburimu/Qufim/Tavnazia] for <number> [day/days] (Vana'diel time).
        PLAYERS_HAVE_NOT_REACHED_LEVEL = 7850, -- Players who have not reached level <number> are prohibited from entering Dynamis.
        HOMEPOINT_SET                  = 12694, -- Home point set!
        REGIME_REGISTERED              = 10330, -- New training regime registered!
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