-----------------------------------
-- Area: Bearclaw Pinnacle
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")
-----------------------------------
local loot =
{
    -- ENM: Follow the White Rabbit (Wiki showed ???% for droprate, these are guesses based on other ENMs)
    [641] =
    {
        {
            {itemid = 1769, droprate = 268},  -- Square of Galateia (26.8% Drop Rate)
            {itemid = 1764, droprate = 266},  -- Kejusu Satin
            {itemid = 1763, droprate = 342},  -- Viridian Urushi
        },
        {
            {itemid = 1842, droprate = 56},   -- Cloud Evoker (5.6% Drop Rate)
        },
        {
            {itemid = 18380, droprate = 92},  -- Martial Sword
            {itemid = 17798, droprate = 83},  -- Shamo
            {itemid = 15301, droprate = 120}, -- Venturer's Belt
            {itemid = 14673, droprate = 180}, -- Serene Ring
            {itemid = 4748, droprate = 116},  -- Scroll of Raise III
        },
    },

    -- ENM: When Hell Freezes Over (Wiki showed ???% for droprate, these are guesses based on other ENMs)
    [642] =
    {
        {
            {itemid = 1769, droprate = 268},  -- Square of Galateia (26.8% Drop Rate)
            {itemid = 1764, droprate = 266},  -- Kejusu Satin
            {itemid = 1763, droprate = 342},  -- Viridian Urushi
        },
        {
            {itemid = 1842, droprate = 56},   -- Cloud Evoker (5.6% Drop Rate)
        },
        {
            {itemid = 18221, droprate = 116}, -- Martial Bhuj
            {itemid = 17210, droprate = 116}, -- Martial Gun
            {itemid = 17593, droprate = 116}, -- Martial Staff
            {itemid = 13628, droprate = 116}, -- Hexerei Cape
            {itemid = 13647, droprate = 116}, -- Settler's Cape
            {itemid = 4748, droprate = 116},  -- Scroll of Raise III
        },
        {
            {itemid = 18221, droprate = 116}, -- Martial Bhuj
            {itemid = 17210, droprate = 116}, -- Martial Gun
            {itemid = 17593, droprate = 116}, -- Martial Staff
            {itemid = 13628, droprate = 116}, -- Hexerei Cape
            {itemid = 13647, droprate = 116}, -- Settler's Cape
            {itemid = 4748, droprate = 116},  -- Scroll of Raise III
        },
    },
	
    -- ENM: Brothers
    [643] =
    {
        {
            {itemid = 1767, droprate = 271},  -- Eltoro Leather
            {itemid = 1762, droprate = 340},  -- Cassia Lumber
            {itemid = 1771, droprate = 330},  -- Dragon Bone
        },
        {
            {itemid = 1842, droprate = 44},   -- Cloud Evoker
        },
        {
            {itemid = 15302, droprate = 123}, -- Scouter's Rope
            {itemid = 17277, droprate = 163}, -- Hedgehog Bomb
            {itemid = 17707, droprate = 167}, -- Martial Anelace
            {itemid = 18098, droprate = 148}, -- Martial Lance
            {itemid = 4748, droprate = 281},  -- Scroll of Raise III
        },
        {
            {itemid = 15302, droprate = 128}, -- Scouter's Rope
            {itemid = 17277, droprate = 163}, -- Hedgehog Bomb
            {itemid = 17707, droprate = 167}, -- Martial Anelace
            {itemid = 18098, droprate = 153}, -- Martial Lance
            {itemid = 4748, droprate = 271},  -- Scroll of Raise III
        },
    },

    -- ENM: Holy Cow (Wiki showed ???% for droprate, these are guesses based on other ENMs)
    [644] =
    {
        {
            {itemid = 1771, droprate = 330},  -- Dragon Bone
            {itemid = 1767, droprate = 271},  -- Eltoro Leather
            {itemid = 1762, droprate = 340},  -- Cassia Lumber
        },
        {
            {itemid = 1842, droprate = 44},   -- Cloud Evoker
        },
        {
            {itemid = 17209, droprate = 167}, -- Martial Bow
            {itemid = 18356, droprate = 167}, -- Martial Knuckles
            {itemid = 13648, droprate = 160}, -- Gigant Mantle
            {itemid = 13694, droprate = 160}, -- Psilos Mantle
            {itemid = 4748, droprate = 281},  -- Scroll of Raise III
        },
        {
            {itemid = 17209, droprate = 167}, -- Martial Bow
            {itemid = 18356, droprate = 167}, -- Martial Knuckles
            {itemid = 13648, droprate = 160}, -- Gigant Mantle
            {itemid = 13694, droprate = 160}, -- Psilos Mantle
            {itemid = 4748, droprate = 281},  -- Scroll of Raise III
        },
    }
}

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        dsp.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
