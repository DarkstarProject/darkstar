-----------------------------------
-- Area: Sacrarium
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SACRARIUM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED   = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED             = 6387, -- Obtained: <item>.
        GIL_OBTAINED              = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED          = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY   = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE             = 7048, -- Tallying conquest results...
        LARGE_KEYHOLE_DESCRIPTION = 7214, -- The gate is securely closed with two locks. This keyhole is engraved with a sealion insignia.
        SMALL_KEYHOLE_DESCRIPTION = 7215, -- The gate is securely closed with two locks. This keyhole is engraved with a coral insignia.
        KEYHOLE_DAMAGED           = 7216, -- The keyhole is damaged.  The gate cannot be opened from this side.
        CANNOT_OPEN_SIDE          = 7217, -- The gate cannot be opened from this side.
        CANNOT_TRADE_NOW          = 7218, -- You cannot trade right now.
        STURDY_GATE               = 7219, -- A sturdy iron gate. It is secured with two locks--a main lock and a sublock.
        CORAL_KEY_BREAKS          = 7223, -- The <item> breaks!
        EVIL_PRESENCE             = 7257, -- You sense an evil presence!
        DRAWER_OPEN               = 7258, -- You open the drawer.
        DRAWER_EMPTY              = 7259, -- There is nothing inside.
        DRAWER_SHUT               = 7260, -- The drawer is jammed shut.
        CHEST_UNLOCKED            = 7348, -- You unlock the chest!
        START_GET_GOOSEBUMPS      = 7358, -- You start to get goosebumps.
        HEART_RACING              = 7359, -- Your heart is racing.
        LEAVE_QUICKLY_AS_POSSIBLE = 7360, -- Your common sense tells you to leave as quickly as possible.
        NOTHING_HAPPENS           = 7363, -- Nothing happens.
    },
    mob =
    {
        SWIFT_BELT_NMS          =
        {
            {16892068, {[1] = true, [2] = true}},   -- Balor (hume)
            {16892069, {[3] = true, [4] = true}},   -- Luaith (elvaan)
            {16892070, {[5] = true, [6] = true}},   -- Lobais (tarutaru)
            {16892073, {[7] = true}},               -- Caithleann (mithra)
            {16892074, {[8] = true}},               -- Indich (galka)
        },
        OLD_PROFESSOR_MARISELLE = 16891970,
    },
    npc =
    {
        STALE_DRAFT_OFFSET         = 16892097,
        SACRARIUM_LABYRINTH_OFFSET = 16892110,
        SMALL_KEYHOLE              = 16892142,
        TREASURE_CHEST             = 16892183,
    },
}

return zones[dsp.zone.SACRARIUM]