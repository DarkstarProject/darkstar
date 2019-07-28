-----------------------------------
-- Area: Dynamis-Xarcabard
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DYNAMIS_XARCABARD] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED      = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6388, -- Obtained: <item>.
        GIL_OBTAINED                 = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE                = 7055, -- Tallying conquest results...
        DYNAMIS_TIME_BEGIN           = 7214, -- The sands of the <item> have begun to fall. You have <number> minutes (Earth time) remaining in Dynamis.
        DYNAMIS_TIME_EXTEND          = 7215, -- our stay in Dynamis has been extended by <number> minute[/s].
        DYNAMIS_TIME_UPDATE_1        = 7216, -- ou will be expelled from Dynamis in <number> [second/minute] (Earth time).
        DYNAMIS_TIME_UPDATE_2        = 7217, -- ou will be expelled from Dynamis in <number> [seconds/minutes] (Earth time).
        DYNAMIS_TIME_EXPIRED         = 7219, -- The sands of the hourglass have emptied...
        ANIMATED_KNUCKLES_DIALOG     = 7297, -- I am known as the Fists of Mystics. Come, show me your fighting spirit.
        ANIMATED_DAGGER_DIALOG       = 7329, -- I am called the Ornate Blade. Now, show me your strength.
        ANIMATED_LONGSWORD_DIALOG    = 7361, -- People have named me the Holy Blade. I will try thy resolution.
        ANIMATED_CLAYMORE_DIALOG     = 7393, -- I am the Intricate Blade. Show me the depths of your fury!
        ANIMATED_TABAR_DIALOG        = 7425, -- Me, axe. Runaeic, Axe. You, die?
        ANIMATED_GREATAXE_DIALOG     = 7457, -- I have been given the title of Seraphic Axe. Will you attempt to survive my love?
        ANIMATED_SPEAR_DIALOG        = 7489, -- I am the Stellar Spear. It is time to test your courage.
        ANIMATED_SCYTHE_DIALOG       = 7521, -- I am known as the Tenebrous Scythe. Overwhelm me with your greed for power.
        ANIMATED_KUNAI_DIALOG        = 7553, -- I am called the Demoniac Blade. Allow me to witness your technique.
        ANIMATED_TACHI_DIALOG        = 7585, -- I am the Divine Blade. I demand a test of your will.
        ANIMATED_HAMMER_DIALOG       = 7617, -- People have named me the Heavenly Hammer. I will test your might to its very limits.
        ANIMATED_STAFF_DIALOG        = 7649, -- I am called the Celestial Staff. I will glimpse into your mind's eye...
        ANIMATED_LONGBOW_DIALOG      = 7681, -- I am known as the Snarled Bow. I will measure the limits of your determination.
        ANIMATED_GUN_DIALOG          = 7713, -- I am known as the Ethereal Rifle. Do you realize my incredible value?
        ANIMATED_HORN_DIALOG         = 7745, -- I am called the Mysterial Horn. Show me your true intentions.
        ANIMATED_SHIELD_DIALOG       = 7777, -- I am Aegis, the impervious shield of everlasting.
        PRISON_OF_SOULS_HAS_SET_FREE = 7809, -- e prison of souls has set free its captive spirits!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.DYNAMIS_XARCABARD]