-----------------------------------
-- Area: Sauromugue_Champaign
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SAUROMUGUE_CHAMPAIGN] =
{
    text =
    {
        NOTHING_HAPPENS          = 141, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6403, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6409, -- Obtained: <item>.
        GIL_OBTAINED             = 6410, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6412, -- Obtained key item: <keyitem>.
        CONQUEST_BASE            = 7070, -- Tallying conquest results...
        MANY_TIGER_BONES         = 7229, -- There are many tiger bones here...
        OLD_SABERTOOTH_DIALOG_I  = 7235, -- You hear the distant roar of a tiger. It sounds as if the beast is approaching slowly...
        OLD_SABERTOOTH_DIALOG_II = 7236, -- The sound of the tiger's footsteps is growing louder.
        FISHING_MESSAGE_OFFSET   = 7237, -- You can't fish here.
        DIG_THROW_AWAY           = 7250, -- You dig up ?Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?, but your inventory is full.
        FIND_NOTHING             = 7252, -- You dig and you dig, but find nothing.
        THF_AF_MOB               = 7414, -- Something has come down from the tower!
        NOTHING_OUT_OF_ORDINARY  = 7432, -- There is nothing out of the ordinary here.
        THF_AF_WALL_OFFSET       = 7433, -- It is impossible to climb this wall with your bare hands.
    },
    mob =
    {
        DEADLY_DODO_PH     = 
        {
            [17268849] = 17268851, -- 238.000 40.000 332.000
            [17268850] = 17268851, -- 369.564 39.658 345.197
        },
        BLIGHTING_BRAND_PH = 
        {
            [17269013] = 17269016, -- 240.725 1.853 223.185
        },
        OLD_SABERTOOTH     = 17268808,
        ROC                = 17269106,
        CLIMBPIX_HIGHRISE  = 17269107,
        DRIBBLIX_GREASEMAW = 17269114,
    },
    npc =
    {
    },
}

return zones[dsp.zone.SAUROMUGUE_CHAMPAIGN]