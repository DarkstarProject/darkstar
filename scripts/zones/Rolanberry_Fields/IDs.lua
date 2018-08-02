-----------------------------------
-- Area: Rolanberry_Fields
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ROLANBERRY_FIELDS] =
{
    text =
    {
        NOTHING_HAPPENS         = 141, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED = 6403, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6409, -- Obtained: <item>.
        GIL_OBTAINED            = 6410, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6412, -- Obtained key item: <keyitem>.
        NOT_ENOUGH_GIL          = 6414, -- You do not have enough gil.
        CONQUEST_BASE           = 7070, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7229, -- You can't fish here.
        DIG_THROW_AWAY          = 7242, -- You dig up ?Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?, but your inventory is full.
        FIND_NOTHING            = 7244, -- You dig and you dig, but find nothing.
        SIGN                    = 7399, -- North: Grand Duchy of Jeuno, Sauromugue Champaign South: Pashhow Marshlands
        AWAIT_YOUR_CHALLENGE    = 12167, -- We await your challenge
        LACK_LEGION_POINTS      = 12204, -- It would seem that you lack the necessary amount of Legion points.
    },
    mob =
    {
        DROOLING_DAISY_PH = 
        {
            [17228235] = 17228236, -- -691.786 -34.802 -335.763
        },
        ELDRITCH_EDGE_PH  = 
        {
            [17228152] = 17228150, -- 440 -28 -44
            [17228148] = 17228150, -- 396.992 -24.01 -152.613
            [17228149] = 17228150, -- 395 -24 -147
        },
        SILK_CATERPILLAR  = 17227782,
        SIMURGH           = 17228242,
        CHUGLIX_BERRYPAWS = 17228249,
    },
    npc =
    {
    },
}

return zones[dsp.zone.ROLANBERRY_FIELDS]