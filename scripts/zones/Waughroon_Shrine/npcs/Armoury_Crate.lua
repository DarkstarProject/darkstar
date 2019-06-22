-----------------------------------
-- Area: Waughroon Shrine
-- NPC:  Armoury Crate
-- Waughroon Shrine Burning Armoury_Crate
-------------------------------------

require("scripts/globals/bcnm")
require("scripts/globals/battlefield")
-------------------------------------
local loot =
{
    -- BCNM Birds of a Feather
    [73] = 
    {
        {
            {itemid = 4570, droprate = 1000}, -- Bird Egg
        },
        {
            {itemid = 14735, droprate = 125}, -- Ashigaru Earring
            {itemid = 14732, droprate = 125}, -- Trimmers Earring
            {itemid = 14734, droprate = 125}, -- Beaters Earring
            {itemid = 13437, droprate = 125}, -- Healers Earring
            {itemid = 13435, droprate = 125}, -- Mercenarys Earring
            {itemid = 14733, droprate = 125}, -- Singers Earring
            {itemid = 13438, droprate = 125}, -- Wizards Earring
            {itemid = 13436, droprate = 125}, -- Wrestlers Earring
        },
        {
            {itemid = 15285, droprate = 142}, -- Avatar Belt
            {itemid = 15276, droprate = 142}, -- Dagger Belt
            {itemid = 15284, droprate = 142}, -- Lance Belt
            {itemid = 15275, droprate = 142}, -- Rapier Belt
            {itemid = 15283, droprate = 142}, -- Sarashi
            {itemid = 15278, droprate = 142}, -- Scythe Belt
            {itemid = 15277, droprate = 142}, -- Shield Belt
        },
        {
            {itemid = 4868, droprate = 105},  -- Scroll Of Dispel
            {itemid = 4751, droprate = 79},   -- Scroll Of Erase
            {itemid = 5070, droprate = 421},  -- Scroll Of Magic Finale
            {itemid = 4947, droprate = 79},   -- Scroll Of Utsusemi Ni
        },
        {
            {itemid = 847, droprate = 330},   -- Bird Feather
            {itemid = 694, droprate = 130},   -- Chestnut Log
            {itemid = 690, droprate = 125},   -- Elm Log
            {itemid = 4132, droprate = 210},  -- Hi-ether
            {itemid = 4222, droprate = 235},  -- Horn Quiver
            {itemid = 651, droprate = 98},    -- Iron Ingot
            {itemid = 795, droprate = 130},   -- Lapis Lazuli
            {itemid = 796, droprate = 150},   -- Light Opal
            {itemid = 653, droprate = 184},   -- Mythril Ingot
            {itemid = 644, droprate = 159},   -- Chunk Of Mythril Ore
            {itemid = 799, droprate = 160},   -- Onyx
            {itemid = 736, droprate = 180},   -- Chunk Of Silver Ore
            {itemid = 744, droprate = 175},   -- Silver Ingot
        },
    },

    -- KSNM The Hills are Alive
    [76] = 
    {
        {
            {itemid = 18047, droprate = 188}, -- Havoc Scythe
            {itemid = 17939, droprate = 27},  -- Kriegsbeil
            {itemid = 17937, droprate = 170}, -- Leopard Axe
            {itemid = 1441, droprate = 295},  -- Libation Abjuration
            {itemid = 18351, droprate = 27},  -- Meteor Cesti
            {itemid = 17464, droprate = 71},  -- Purgatory Mace
            {itemid = 17575, droprate = 196}, -- Somnus Signa
        },
        {
            {itemid = 18211, droprate = 45},  -- Gawains Axe
            {itemid = 17576, droprate = 259}, -- Grim Staff
            {itemid = 17245, droprate = 241}, -- Grosveneurs Bow
            {itemid = 17838, droprate = 143}, -- Harlequins Horn
            {itemid = 1442, droprate = 161},  -- Oblation Abjuration
            {itemid = 17996, droprate = 143}, -- Stylet
            {itemid = 17578, droprate = 36},  -- Zen Pole
        },
        {
            {itemid = 3343, droprate = 1},    -- Clump Of Blue Pondweed
        },
        {
            {itemid = 683, droprate = 446},   -- Adaman Chain
            {itemid = 908, droprate = 420},   -- Adamantoise Shell
            {itemid = 1312, droprate = 71},   -- Piece Of Angel Skin
            {itemid = 14080, droprate = 26},  -- Strider Boots
        },
        {
            {itemid = 887, droprate = 116},   -- Coral Fragment
            {itemid = 645, droprate = 89},    -- Chunk Of Darksteel Ore
            {itemid = 902, droprate = 71},    -- Demon Horn
            {itemid = 702, droprate = 152},   -- Ebony Log
            {itemid = 737, droprate = 107},   -- Chunk Of Gold Ore
            {itemid = 823, droprate = 89},    -- Spool Of Gold Thread
            {itemid = 1465, droprate = 45},   -- Slab Of Granite
            {itemid = 4173, droprate = 71},   -- Hi-reraiser
            {itemid = 700, droprate = 107},   -- Mahogany Log
            {itemid = 703, droprate = 223},   -- Petrified Log
            {itemid = 738, droprate = 116},   -- Chunk Of Platinum Ore
            {itemid = 830, droprate = 54},    -- Square Of Rainbow Cloth
            {itemid = 895, droprate = 54},    -- Ram Horn
            {itemid = 1132, droprate = 71},   -- Square Of Raxa
            {itemid = 4172, droprate = 45},   -- Reraiser
            {itemid = 866, droprate = 54},    -- Handful Of Wyvern Scales
            {itemid = 4174, droprate = 63},   -- Vile Elixir
            {itemid = 4175, droprate = 45},   -- Vile Elixir +1
        },
        {
            {itemid = 683, droprate = 268},   -- Adaman Chain
            {itemid = 1525, droprate = 143},  -- Adamantoise Egg
            {itemid = 4205, droprate = 80},   -- Agility Potion
            {itemid = 4201, droprate = 143},  -- Dexterity Potion
            {itemid = 4199, droprate = 214},  -- Strength Potion
            {itemid = 4203, droprate = 196},  -- Vitality Potion
        },  
        {
            {itemid = 646, droprate = 107},   -- Chunk Of Adaman Ore
            {itemid = 4211, droprate = 89},   -- Charisma Potion
            {itemid = 645, droprate = 179},   -- Chunk Of Darksteel Ore
            {itemid = 4213, droprate = 134},  -- Icarus Wing
            {itemid = 4207, droprate = 152},  -- Intelligence Potion
            {itemid = 4209, droprate = 80},   -- Mind Potion
            {itemid = 739, droprate = 80},    -- Chunk Of Orichalcum Ore
            {itemid = 738, droprate = 107},   -- Chunk Of Platinum Ore
            {itemid = 17698, droprate = 152}, -- Princely Sword
        },
        {
            {itemid = 4135, droprate = 295},  -- Hi-ether +3
            {itemid = 4119, droprate = 250},  -- Hi-potion +3
            {itemid = 4173, droprate = 196},  -- Hi-reraiser
            {itemid = 4175, droprate = 214},  -- Vile Elixir +1
        },
        {
            {itemid = 887, droprate = 139},   -- Coral Fragment
            {itemid = 645, droprate = 59},    -- Chunk Of Darksteel Ore
            {itemid = 902, droprate = 50},    -- Demon Horn
            {itemid = 702, droprate = 109},   -- Ebony Log
            {itemid = 737, droprate = 69},    -- Chunk Of Gold Ore
            {itemid = 1465, droprate = 99},   -- Slab Of Granite
            {itemid = 4173, droprate = 79},   -- Hi-reraiser
            {itemid = 700, droprate = 129},   -- Mahogany Log
            {itemid = 644, droprate = 119},   -- Chunk Of Mythril Ore
            {itemid = 844, droprate = 69},    -- Phoenix Feather
            {itemid = 703, droprate = 168},   -- Petrified Log
            {itemid = 738, droprate = 129},   -- Chunk Of Platinum Ore
            {itemid = 895, droprate = 109},   -- Ram Horn
            {itemid = 1132, droprate = 79},   -- Square Of Raxa
            {itemid = 4174, droprate = 69},   -- Vile Elixir
            {itemid = 866, droprate = 79},    -- Handful Of Wyvern Scales
            {itemid = 4172, droprate = 50},   -- Reraiser
            {itemid = 823, droprate = 89},    -- Spool Of Gold Thread
        },
        {
            {itemid = 1110, droprate = 109},  -- Vial Of Black Beetle Blood
            {itemid = 836, droprate = 89},    -- Square Of Damascene Cloth
            {itemid = 658, droprate = 78},    -- Damascus Ingot
            {itemid = 837, droprate = 99},    -- Spool Of Malboro Fiber
            {itemid = 942, droprate = 188},   -- Philosophers Stone
            {itemid = 844, droprate = 238},   -- Phoenix Feather
            {itemid = 1132, droprate = 109},  -- Square Of Raxa
        },
        {
            {itemid = 722, droprate = 79},    -- Divine Log
            {itemid = 1446, droprate = 257},  -- Lacquer Tree Log
            {itemid = 703, droprate = 337},   -- Petrified Log
            {itemid = 831, droprate = 149},   -- Square Of Shining Cloth
        },
    },
    
    -- BCNM Up In Arms
    [79] = 
    {
        {
            {itemid = 65535, droprate = 1000, amount = 15000}, -- Gil
        },
        {
            {itemid = 793, droprate = 1000}, -- Black Pearl
        },
        {
            {itemid = 792, droprate = 1000}, -- Pearl
        },
        {
            {itemid = 792, droprate = 1000}, -- Pearl
        },
        {
            {itemid = 1311, droprate = 1000},-- Piece Of Oxblood
        },
        {
            {itemid = 1311, droprate = 1000},-- Piece Of Oxblood
        },
        {
            {itemid = 1311, droprate = 1000},-- Piece Of Oxblood
        },
        {
            {itemid = 14666, droprate = 447},-- Teleport Ring Altep
            {itemid = 14662, droprate = 487},-- Teleport Ring Dem
        },
        {
            {itemid = 13175, droprate = 494},-- Ajari Bead Necklace
            {itemid = 13176, droprate = 449},-- Philomath Stole
        },
        {
            {itemid = 791, droprate = 51},   -- Aquamarine
            {itemid = 801, droprate = 32},   -- Chrysoberyl
            {itemid = 654, droprate = 39},   -- Darksteel Ingot
            {itemid = 702, droprate = 21},   -- Ebony Log
            {itemid = 4173, droprate = 32},  -- Hi-reraiser
            {itemid = 745, droprate = 55},   -- Gold Ingot
            {itemid = 784, droprate = 62},   -- Jadeite
            {itemid = 653, droprate = 81},   -- Mythril Ingot
            {itemid = 802, droprate = 56},   -- Moonstone
            {itemid = 797, droprate = 195},  -- Painite
            {itemid = 652, droprate = 58},   -- Steel Ingot
            {itemid = 803, droprate = 38},   -- Sunstone
            {itemid = 773, droprate = 11},   -- Translucent Rock
            {itemid = 4175, droprate = 21},  -- Vile Elixir +1
            {itemid = 771, droprate = 15},   -- Yellow Rock
            {itemid = 805, droprate = 26},   -- Zircon
            {itemid = 769, droprate = 21},   -- Red Rock
            {itemid = 700, droprate = 17},   -- Mahogany Log
            {itemid = 770, droprate = 9},    -- Blue Rock
            {itemid = 810, droprate = 62},   -- Fluorite
            {itemid = 774, droprate = 11},   -- Purple Rock
            {itemid = 775, droprate = 11},   -- Black Rock
            {itemid = 772, droprate = 11},   -- Green Rock
            {itemid = 776, droprate = 9},    -- White Rock
        },
        {
            {itemid = 0, droprate = 900},    -- Nothing
            {itemid = 17440, droprate = 13}, -- Kraken Club
            {itemid = 15185, droprate = 55}, -- Walkure Mask
        },
    },

    -- KSNM Operation Desert Swarm
    [81] = 
    {
        {
            {itemid = 1473, droprate = 813}, -- High-quality Scorpion Shell
            {itemid = 13552, droprate = 55}, -- Serket Ring
            {itemid = 901, droprate = 123}, -- Venomous Claw
        },
        {
            {itemid = 17207, droprate = 216}, -- Expunger
            {itemid = 18005, droprate = 295}, -- Heart Snatcher
            {itemid = 18217, droprate = 239}, -- Rampager
            {itemid = 17793, droprate = 231}, -- Senjuinrikio
        },
        {
            {itemid = 17624, droprate = 504}, -- Anubiss Knife
            {itemid = 655, droprate = 4}, -- Adaman Ingot
            {itemid = 19027, droprate = 86}, -- Claymore Grip
            {itemid = 747, droprate = 22}, -- Orichalcum Ingot
            {itemid = 19025, droprate = 146}, -- Pole Grip
            {itemid = 19024, droprate = 22}, -- Sword Strap
        },
        {
            {itemid = 15295, droprate = 287}, -- Hierarch Belt
            {itemid = 12407, droprate = 216}, -- Palmerins Shield
            {itemid = 14871, droprate = 198}, -- Trainers Gloves
            {itemid = 15294, droprate = 287}, -- Warwolf Belt
        },
        {
            {itemid = 887, droprate = 52}, -- Coral Fragment
            {itemid = 645, droprate = 56}, -- Chunk Of Darksteel Ore
            {itemid = 902, droprate = 41}, -- Demon Horn
            {itemid = 702, droprate = 63}, -- Ebony Log
            {itemid = 737, droprate = 52}, -- Chunk Of Gold Ore
            {itemid = 823, droprate = 26}, -- Spool Of Gold Thread
            {itemid = 1465, droprate = 11}, -- Slab Of Granite
            {itemid = 4173, droprate = 37}, -- Hi-reraiser
            {itemid = 700, droprate = 101}, -- Mahogany Log
            {itemid = 653, droprate = 0}, -- Mythril Ingot
            {itemid = 644, droprate = 52}, -- Chunk Of Mythril Ore
            {itemid = 703, droprate = 116}, -- Petrified Log
            {itemid = 844, droprate = 15}, -- Phoenix Feather
            {itemid = 942, droprate = 56}, -- Philosophers Stone
            {itemid = 738, droprate = 45}, -- Chunk Of Platinum Ore
            {itemid = 830, droprate = 22}, -- Square Of Rainbow Cloth
            {itemid = 895, droprate = 67}, -- Ram Horn
            {itemid = 1132, droprate = 119}, -- Square Of Raxa
            {itemid = 4172, droprate = 45}, -- Reraiser
            {itemid = 4174, droprate = 19}, -- Vile Elixir
            {itemid = 4175, droprate = 41}, -- Vile Elixir +1
            {itemid = 866, droprate = 34}, -- Handful Of Wyvern Scales
        },
        {
            {itemid = 1110, droprate = 78}, -- Vial Of Black Beetle Blood
            {itemid = 836, droprate = 56}, -- Square Of Damascene Cloth
            {itemid = 658, droprate = 93}, -- Damascus Ingot
            {itemid = 837, droprate = 56}, -- Spool Of Malboro Fiber
            {itemid = 942, droprate = 157}, -- Philosophers Stone
            {itemid = 844, droprate = 276}, -- Phoenix Feather
            {itemid = 1132, droprate = 209}, -- Square Of Raxa
        },
    },

    -- KSNM Prehistoric Pigeons
    [82] = 
    {
        {
            {itemid = 17827, droprate = 217}, -- Michishiba-no-tsuyu
            {itemid = 17699, droprate = 174}, -- Dissector
            {itemid = 17275, droprate = 333}, -- Coffinmaker
            {itemid = 18053, droprate = 174}, -- Gravedigger
        },
        {
            {itemid = 19027, droprate = 144}, -- Claymore Grip
            {itemid = 658, droprate = 275},   -- Damascus Ingot
            {itemid = 843, droprate = 275},   -- Giant Bird Plume
            {itemid = 19025, droprate = 203}, -- Pole Grip
            {itemid = 19026, droprate = 116}, -- Spear Strap
        },
        {
            {itemid = 655, droprate = 159},   -- Adaman Ingot
            {itemid = 747, droprate = 290},   -- Orichalcum Ingot
            {itemid = 14765, droprate = 406}, -- Titanis Earring
        },
        {
            {itemid = 15325, droprate = 159}, -- Evokers Boots
            {itemid = 14872, droprate = 217}, -- Ostreger Mitts
            {itemid = 15181, droprate = 145}, -- Pineal Hat
            {itemid = 15387, droprate = 159}, -- Trackers Kecks
        },
        {
            {itemid = 887, droprate = 101},   -- Coral Fragment
            {itemid = 645, droprate = 29},    -- Chunk Of Darksteel Ore
            {itemid = 902, droprate = 29},    -- Demon Horn
            {itemid = 702, droprate = 29},    -- Ebony Log
            {itemid = 745, droprate = 101},   -- Gold Ingot
            {itemid = 823, droprate = 29},    -- Spool Of Gold Thread
            {itemid = 644, droprate = 29},    -- Chunk Of Mythril Ore
            {itemid = 703, droprate = 58},    -- Petrified Log
            {itemid = 738, droprate = 14},    -- Chunk Of Platinum Ore
            {itemid = 830, droprate = 58},    -- Square Of Rainbow Cloth
            {itemid = 895, droprate = 14},    -- Ram Horn
            {itemid = 1132, droprate = 159},  -- Square Of Raxa
            {itemid = 837, droprate = 72},    -- Spool Of Malboro Fiber
        },
        {
            {itemid = 1110, droprate = 87},   -- Vial Of Black Beetle Blood
            {itemid = 658, droprate = 14},    -- Damascus Ingot
            {itemid = 836, droprate = 29},    -- Square Of Damascene Cloth
            {itemid = 942, droprate = 174},   -- Philosophers Stone
            {itemid = 844, droprate = 246},   -- Phoenix Feather
            {itemid = 1132, droprate = 159},  -- Square Of Raxa
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

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end
