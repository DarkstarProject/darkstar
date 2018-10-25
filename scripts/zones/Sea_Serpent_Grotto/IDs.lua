-----------------------------------
-- Area: Sea_Serpent_Grotto
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SEA_SERPENT_GROTTO] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6385, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6387, -- Obtained: <item>.
        GIL_OBTAINED               = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6390, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED             = 6396, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY    = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE              = 7048, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET     = 7207, -- You can't fish here.
        CHEST_UNLOCKED             = 7314, -- You unlock the chest!
        SAHAGIN_DOOR_INSIDE        = 7332, -- The door is tightly shut.
        SAHAGIN_DOOR_OUTSIDE       = 7333, -- This door has an oddly shaped keyhole. It looks as if once you enter, you may not be able to get out the way you came in.
        SAHAGIN_DOOR_TRADED        = 7334, -- The <item> breaks!
        FIRST_CHECK                = 7338, -- You do not see anything out of the ordinary.
        SECOND_CHECK               = 7339, -- You do not see anything out of the ordinary...
        THIRD_CHECK                = 7340, -- It looks like a rock wall.
        FOURTH_CHECK               = 7341, -- It looks like a rock wall...
        FIFTH_CHECK                = 7342, -- You see a small indentation in the wall.
        SILVER_CHECK               = 7343, -- You see something silver glittering around the indentation.
        MYTHRIL_CHECK              = 7344, -- You find something that looks like mythril dust scattered about the indentation.
        GOLD_CHECK                 = 7345, -- You see something gold glittering around the indentation.
        COMPLETED_CHECK            = 7346, -- It is a door you can open using <item>!
        SENSE_OMINOUS_PRESENCE     = 7360, -- You sense an ominous presence...
        REGIME_REGISTERED          = 9680, -- New training regime registered!
    },
    mob =
    {
        CHARYBDIS_PH =
        {
            [17498518] = 17498522,  -- -138.181, 48.389, -338.001
            [17498520] = 17498522  -- -212.407, 38.538, -342.544
        },
        MIMIC        = 17498564,
        WATER_LEAPER = 17498565,
    },
    npc =
    {
        TREASURE_CHEST  = 17498625,
        TREASURE_COFFER = 17498626,
    },
}

return zones[dsp.zone.SEA_SERPENT_GROTTO]