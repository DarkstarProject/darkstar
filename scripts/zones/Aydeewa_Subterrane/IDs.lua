-----------------------------------
-- Area: Aydeewa_Subterrane
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.AYDEEWA_SUBTERRANE] =
{
    text =
    {
        NOTHING_HAPPENS         = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET  = 7049, -- You can't fish here.
        MINING_IS_POSSIBLE_HERE = 7320, -- Mining is possible here if you have <item>.
        BLOOD_STAINS            = 8029, -- The ground is smeared with bloodstains...
        DRAWS_NEAR              = 8030, -- Something draws near!
    },
    mob =
    {
        BLUESTREAK_GYUGYUROON_PH =
        {
            [17055941] = 17056156, -- -221.7 13.762 -346.83
            [17055942] = 17056156, -- -219 14.003 -364.83
        },
        NOSFERATU          = 17056157,
        PANDEMONIUM_WARDEN = 17056168,
        CHIGRE             = 17056186,
    },
    npc =
    {
    },
}

return zones[dsp.zone.AYDEEWA_SUBTERRANE]