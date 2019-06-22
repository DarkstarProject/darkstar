-----------------------------------
-- Area: Ghelsba_Outpost
-- NPC:  Armoury Crate
-- Ghelsba_Outpost Armoury_Crate
-------------------------------------

require("scripts/globals/bcnm")
require("scripts/globals/battlefield")
-----------------------------------
local loot =
{
    -- BCNM Wings of Fury
    [34] = 
    {
        {
            {itemid = 891, droprate = 1000}, -- Bat Fang
        },
        {
            {itemid = 4900, droprate = 306}, -- Thunder Spirit Pact
            {itemid = 4744, droprate = 319}, -- Scroll Of Invisible
            {itemid = 4745, droprate = 125}, -- Scroll Of Sneak
            {itemid = 4746, droprate = 222}, -- Scroll Of Deodorize
        },
        {
            {itemid = 17786, droprate = 153},-- Ganko
            {itemid = 18170, droprate = 139},-- Platoon Edge
            {itemid = 16687, droprate = 83}, -- Platoon Axe
            {itemid = 17571, droprate = 97}, -- Platoon Pole
            {itemid = 17993, droprate = 125},-- Platoon Dagger
            {itemid = 749, droprate = 444},  -- Mythril Beastcoin
            {itemid = 773, droprate = 56},   -- Translucent Rock
        },
        {
            {itemid = 17820, droprate = 111},-- Gunromaru
            {itemid = 17993, droprate = 139},-- Platoon Dagger
            {itemid = 18170, droprate = 139},-- Platoon Edge
            {itemid = 18085, droprate = 42}, -- Platoon Lance
            {itemid = 16959, droprate = 181},-- Platoon Sword
            {itemid = 774, droprate = 97},   -- Purple Rock
            {itemid = 769, droprate = 69},   -- Red Rock
            {itemid = 776, droprate = 14},   -- White Rock
            {itemid = 775, droprate = 28},   -- Black Rock
            {itemid = 772, droprate = 28},   -- Green Rock
            {itemid = 771, droprate = 14},   -- Yellow Rock
            {itemid = 770, droprate = 69},   -- Blue Rock
        },
        {
            {itemid = 13548, droprate = 167},-- Astral Ring
            {itemid = 922, droprate = 444},  -- Bat Wing
        },
    },

    -- BCNM Petrifying Pair
    [35] = 
    {
        {
            {itemid = 852, droprate = 1000}, -- Lizard Skin
        },
        {
            {itemid = 13014, droprate = 79}, -- Leaping Boots
        },
        {
            {itemid = 15282, droprate = 53}, -- Katana Obi
            {itemid = 15275, droprate = 79}, -- Rapier Belt
            {itemid = 15278, droprate = 157},-- Scythe Belt
            {itemid = 694, droprate = 184},  -- Chestnut Log
            {itemid = 690, droprate = 368},  -- Elm Log
            {itemid = 652, droprate = 79},   -- Steel Ingot
        },
        {
            {itemid = 15282, droprate = 53}, -- Katana Obi
            {itemid = 15275, droprate = 79}, -- Rapier Belt
            {itemid = 15278, droprate = 157},-- Scythe Belt
            {itemid = 694, droprate = 184},  -- Chestnut Log
            {itemid = 690, droprate = 368},  -- Elm Log
            {itemid = 652, droprate = 79},   -- Steel Ingot
        },
        {
            {itemid = 15285, droprate = 105},-- Avatar Belt
            {itemid = 15279, droprate = 105},-- Pick Belt
            {itemid = 651, droprate = 131},  -- Iron Ingot
            {itemid = 643, droprate = 131},  -- Chunk Of Iron Ore
            {itemid = 644, droprate = 79},   -- Chunk Of Mythril Ore
            {itemid = 736, droprate = 79},   -- Chunk Of Silver Ore
            {itemid = 795, droprate = 131},  -- Lapis Lazuli
        },
        {
            {itemid = 17867, droprate = 552},-- Jug Of Cold Carrion Broth
            {itemid = 4877, droprate = 263}, -- Scroll Of Absorb-agi
            {itemid = 4878, droprate = 210}, -- Scroll Of Absorb-int
            {itemid = 4876, droprate = 289}, -- Scroll Of Absorb-vit
            {itemid = 4868, droprate = 105}, -- Scroll Of Dispel
            {itemid = 4751, droprate = 79},  -- Scroll Of Erase
            {itemid = 5070, droprate = 421}, -- Scroll Of Magic Finale
            {itemid = 4947, droprate = 79},  -- Scroll Of Utsusemi Ni
        },
        {
            {itemid = 15271, droprate = 552},-- Axe Belt
            {itemid = 15272, droprate = 131},-- Cestus Belt
            {itemid = 809, droprate = 0},    -- Clear Topaz
            {itemid = 15276, droprate = 79}, -- Dagger Belt
            {itemid = 645, droprate = 105},  -- Chunk Of Darksteel Ore
            {itemid = 15281, droprate = 26}, -- Gun Belt
            {itemid = 4132, droprate = 184}, -- Hi-ether
            {itemid = 796, droprate = 79},   -- Light Opal
            {itemid = 15273, droprate = 157},-- Mace Belt
            {itemid = 653, droprate = 210},  -- Mythril Ingot
            {itemid = 799, droprate = 26},   -- Onyx
            {itemid = 15283, droprate = 263},-- Sarashi
            {itemid = 15277, droprate = 105},-- Shield Belt
            {itemid = 15280, droprate = 105},-- Song Belt
            {itemid = 15274, droprate = 131},-- Staff Belt
            {itemid = 744, droprate = 79},   -- Silver Ingot
            {itemid = 806, droprate = 131},  -- Tourmaline
        },
        {
            {itemid = 15271, droprate = 552},-- Axe Belt
            {itemid = 15272, droprate = 131},-- Cestus Belt
            {itemid = 809, droprate = 0},    -- Clear Topaz
            {itemid = 15276, droprate = 79}, -- Dagger Belt
            {itemid = 645, droprate = 105},  -- Chunk Of Darksteel Ore
            {itemid = 15281, droprate = 26}, -- Gun Belt
            {itemid = 4132, droprate = 184}, -- Hi-ether
            {itemid = 796, droprate = 79},   -- Light Opal
            {itemid = 15273, droprate = 157},-- Mace Belt
            {itemid = 653, droprate = 210},  -- Mythril Ingot
            {itemid = 799, droprate = 26},   -- Onyx
            {itemid = 15283, droprate = 263},-- Sarashi
            {itemid = 15277, droprate = 105},-- Shield Belt
            {itemid = 15280, droprate = 105},-- Song Belt
            {itemid = 15274, droprate = 131},-- Staff Belt
            {itemid = 744, droprate = 79},   -- Silver Ingot
            {itemid = 806, droprate = 131},  -- Tourmaline
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
