-----------------------------------
-- Area: Balgas Dais
-- NPC:  Armoury Crate
-- Balgas Dais Burning Cicrcle Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")
-----------------------------------
local loot =
{
    -- BCNM Treasure and Tribulations
    [100] =
    {
        {
            {itemid = 13292, droprate = 75}, -- Guardians Ring
            {itemid = 13287, droprate = 32}, -- Kampfer Ring
            {itemid = 13300, droprate = 54}, -- Conjurers Ring
            {itemid = 13298, droprate = 32}, -- Shinobi Ring
            {itemid = 13293, droprate = 97}, -- Slayers Ring
            {itemid = 13289, droprate = 75}, -- Sorcerers Ring
            {itemid = 13286, droprate = 108},-- Soldiers Ring
            {itemid = 13294, droprate = 22}, -- Tamers Ring
            {itemid = 13296, droprate = 65}, -- Trackers Ring
            {itemid = 13299, droprate = 32}, -- Drake Ring
            {itemid = 13290, droprate = 32}, -- Fencers Ring
            {itemid = 13295, droprate = 86}, -- Minstrels Ring
            {itemid = 13288, droprate = 86}, -- Medicine Ring
            {itemid = 13291, droprate = 75}, -- Rogues Ring
            {itemid = 13297, droprate = 11}, -- Ronin Ring
            {itemid = 13447, droprate = 32}, -- Platinum Ring
        },
        {
            {itemid = 13548, droprate = 376},-- Astral Ring
            {itemid = 13447, droprate = 22}, -- Platinum Ring
            {itemid = 4818, droprate = 65},  -- Scroll Of Quake
            {itemid = 859, droprate = 0},    -- Ram Skin
            {itemid = 4172, droprate = 11},  -- Reraiser
            {itemid = 653, droprate = 22},   -- Mythril Ingot
            {itemid = 4902, droprate = 0},   -- Light Spirit Pact
            {itemid = 4814, droprate = 32},  -- Scroll Of Freeze
            {itemid = 4719, droprate = 43},  -- Scroll Of Regen Iii
            {itemid = 4621, droprate = 32},  -- Scroll Of Raise Ii
            {itemid = 703, droprate = 11},   -- Petrified Log
            {itemid = 887, droprate = 11},   -- Coral Fragment
            {itemid = 700, droprate = 11},   -- Mahogany Log
            {itemid = 738, droprate = 43},   -- Chunk Of Platinum Ore
            {itemid = 737, droprate = 108},  -- Chunk Of Gold Ore
            {itemid = 645, droprate = 32},   -- Chunk Of Darksteel Ore
            {itemid = 644, droprate = 65},   -- Chunk Of Mythril Ore
            {itemid = 745, droprate = 0},    -- Gold Ingot
            {itemid = 654, droprate = 11},   -- Darksteel Ingot
            {itemid = 746, droprate = 11},   -- Platinum Ingot
            {itemid = 702, droprate = 11},   -- Ebony Log
            {itemid = 895, droprate = 11},   -- Ram Horn
            {itemid = 902, droprate = 11},   -- Demon Horn
            {itemid = 1116, droprate = 0},   -- Manticore Hide
            {itemid = 1122, droprate = 11},  -- Wyvern Skin
            {itemid = 866, droprate = 11},   -- Handful Of Wyvern Scales
        },
    },
    -- BCNM Creeping Doom
    [104] =
    {
        {
            {itemid =   816, droprate = 1000}, -- spool_of_silk_thread
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =   816, droprate =  500}, -- spool_of_silk_thread
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =   816, droprate =  500}, -- spool_of_silk_thread
        },
        {
            {itemid =     0, droprate =  400}, -- nothing
            {itemid = 14733, droprate =   40}, -- singers_earring
            {itemid = 14735, droprate =   40}, -- ashigaru_earring
            {itemid = 14738, droprate =   40}, -- magicians_earring
            {itemid = 13439, droprate =   40}, -- warlocks_earring
            {itemid = 13437, droprate =   40}, -- healers_earring
            {itemid = 14730, droprate =   40}, -- esquires_earring
            {itemid = 13438, droprate =   40}, -- wizards_earring
            {itemid = 14737, droprate =   40}, -- wyvern_earring
            {itemid = 13435, droprate =   40}, -- mercenarys_earring
            {itemid = 14731, droprate =   40}, -- killer_earring
            {itemid = 13436, droprate =   40}, -- wrestlers_earring
            {itemid = 14736, droprate =   40}, -- genin_earring
            {itemid = 14734, droprate =   40}, -- beaters_earring
            {itemid = 14729, droprate =   40}, -- pilferers_earring
            {itemid = 14732, droprate =   40}, -- trimmers_earring
        },
        {
            {itemid =     0, droprate =  400}, -- nothing
            {itemid = 14733, droprate =   40}, -- singers_earring
            {itemid = 14735, droprate =   40}, -- ashigaru_earring
            {itemid = 14738, droprate =   40}, -- magicians_earring
            {itemid = 13439, droprate =   40}, -- warlocks_earring
            {itemid = 13437, droprate =   40}, -- healers_earring
            {itemid = 14730, droprate =   40}, -- esquires_earring
            {itemid = 13438, droprate =   40}, -- wizards_earring
            {itemid = 14737, droprate =   40}, -- wyvern_earring
            {itemid = 13435, droprate =   40}, -- mercenarys_earring
            {itemid = 14731, droprate =   40}, -- killer_earring
            {itemid = 13436, droprate =   40}, -- wrestlers_earring
            {itemid = 14736, droprate =   40}, -- genin_earring
            {itemid = 14734, droprate =   40}, -- beaters_earring
            {itemid = 14729, droprate =   40}, -- pilferers_earring
            {itemid = 14732, droprate =   40}, -- trimmers_earring
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  1134, droprate =  250}, -- sheet_of_bast_parchment
            {itemid =  4116, droprate =  250}, -- hi-potion
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =   694, droprate =  250}, -- chestnut_log
            {itemid =  4132, droprate =  250}, -- hi-ether
        },
        {
            {itemid =     0, droprate =  200}, -- nothing
            {itemid =  4751, droprate =  200}, -- scroll_of_erase
            {itemid =  4868, droprate =  200}, -- scroll_of_dispel
            {itemid =  5070, droprate =  200}, -- scroll_of_magic_finale
            {itemid =  4947, droprate =  200}, -- scroll_of_utsusemi_ni
        },
        {
            {itemid =     0, droprate =  300}, -- nothing
            {itemid =   814, droprate =   50}, -- amber_stone
            {itemid =   645, droprate =   50}, -- chunk_of_darksteel_ore
            {itemid =   690, droprate =   50}, -- elm_log
            {itemid =   651, droprate =   50}, -- iron_ingot
            {itemid =   643, droprate =   50}, -- chunk_of_iron_ore
            {itemid =   795, droprate =   50}, -- lapis_lazuli
            {itemid =   653, droprate =   50}, -- mythril_ingot
            {itemid =   644, droprate =   50}, -- chunk_of_mythril_ore
            {itemid =   799, droprate =   50}, -- onyx
            {itemid =   807, droprate =   50}, -- sardonyx
            {itemid =   744, droprate =   50}, -- silver_ingot
            {itemid =   736, droprate =   50}, -- chunk_of_silver_ore
            {itemid =   652, droprate =   50}, -- steel_ingot
            {itemid =   806, droprate =   50}, -- tourmaline
        },
        {
            {itemid =     0, droprate =  300}, -- nothing
            {itemid =   814, droprate =   50}, -- amber_stone
            {itemid =   645, droprate =   50}, -- chunk_of_darksteel_ore
            {itemid =   690, droprate =   50}, -- elm_log
            {itemid =   651, droprate =   50}, -- iron_ingot
            {itemid =   643, droprate =   50}, -- chunk_of_iron_ore
            {itemid =   795, droprate =   50}, -- lapis_lazuli
            {itemid =   653, droprate =   50}, -- mythril_ingot
            {itemid =   644, droprate =   50}, -- chunk_of_mythril_ore
            {itemid =   799, droprate =   50}, -- onyx
            {itemid =   807, droprate =   50}, -- sardonyx
            {itemid =   744, droprate =   50}, -- silver_ingot
            {itemid =   736, droprate =   50}, -- chunk_of_silver_ore
            {itemid =   652, droprate =   50}, -- steel_ingot
            {itemid =   806, droprate =   50}, -- tourmaline
        },
    },
    -- BCNM Charming Trio
    [105] =
    {
        {
            {itemid = 1603, droprate = 1000}, -- Mannequin Hands
        },
        {
            {itemid = 915, droprate = 250},  -- Jar Of Toad Oil
            {itemid = 4112, droprate = 300}, -- Potion
            {itemid = 4113, droprate = 180}, -- Potion +1
            {itemid = 4898, droprate = 130}, -- Air Spirit Pact
            {itemid = 825, droprate = 280},  -- Square Of Cotton Cloth
        },
        {
            {itemid = 749, droprate = 250},  -- Mythril Beastcoin
            {itemid = 17786, droprate = 190},-- Ganko
            {itemid = 827, droprate = 270},  -- Square Of Wool Cloth
            {itemid = 18171, droprate = 145},-- Platoon Disc
            {itemid = 824, droprate = 295},  -- Square Of Grass Cloth
            {itemid = 826, droprate = 260},  -- Square Of Linen Cloth
        },
        {
            {itemid = 0, droprate = 800},    -- Nothing
            {itemid = 18209, droprate = 167},-- Platoon Cutter
        },
        {
            {itemid = 0, droprate = 500},    -- Nothing
            {itemid = 924, droprate = 500},  -- Vial Of Fiend Blood
        },
        {
            {itemid = 0, droprate = 500},    -- Nothing
            {itemid = 924, droprate = 500},  -- Vial Of Fiend Blood
        },
        {
            {itemid = 18170, droprate = 235},-- Platoon Edge
            {itemid = 17271, droprate = 235},-- Platoon Gun
            {itemid = 17692, droprate = 235},-- Platoon Spatha
            {itemid = 17571, droprate = 235},-- Platoon Pole
            {itemid = 17820, droprate = 255},-- Gunromaru
            {itemid = 1601, droprate = 260}, -- Mannequin Head
            {itemid = 4853, droprate = 250}, -- Scroll Of Drain
            {itemid = 930, droprate = 190},  -- Vial Of Beastman Blood
        },
    },
    -- BCNM Harem Scarem
    [106] =
    {
        {
            {itemid =   857, droprate = 1000}, -- dhalmel_hide
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =   893, droprate =  500}, -- giant_femur
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  4359, droprate =  500}, -- slice_of_dhalmel_meat
        },
        {
            {itemid =     0, droprate =  400}, -- nothing
            {itemid = 13659, droprate =  150}, -- mercenary_mantle
            {itemid = 13669, droprate =  150}, -- beaters_mantle
            {itemid = 13665, droprate =  150}, -- esquires_mantle
            {itemid = 13661, droprate =  150}, -- healers_mantle
        },
        {
            {itemid =     0, droprate =  400}, -- nothing
            {itemid = 12392, droprate =  200}, -- wizards_shield
            {itemid = 12397, droprate =  200}, -- trimmers_aspis
            {itemid = 12402, droprate =  200}, -- wyvern_targe
        },
        {
            {itemid =     0, droprate =  200}, -- nothing
            {itemid =  4751, droprate =  200}, -- scroll_of_erase
            {itemid =  4868, droprate =  200}, -- scroll_of_dispel
            {itemid =  5070, droprate =  200}, -- scroll_of_magic_finale
            {itemid =  4947, droprate =  200}, -- scroll_of_utsusemi_ni
        },
        {
            {itemid =     0, droprate =  250}, -- nothing
            {itemid =   828, droprate =  250}, -- square_of_velvet_cloth
            {itemid =   826, droprate =  250}, -- square_of_linen_cloth
            {itemid =   827, droprate =  250}, -- square_of_wool_cloth
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid =  1601, droprate =  200}, -- mannequin_head
            {itemid =  1603, droprate =  200}, -- mannequin_hands
        },
    },
    -- KSNM Early Bird Catches the Wyrm
    [107] =
    {
        {
            {itemid = 3339, droprate = 1000},-- Jug Of Honey Wine
        },
        {
            {itemid = 1441, droprate = 312}, -- Libation Abjuration
            {itemid = 17694, droprate = 182},-- Guespiere
            {itemid = 18047, droprate = 65}, -- Havoc Scythe
            {itemid = 17937, droprate = 43}, -- Leopard Axe
            {itemid = 18173, droprate = 181},-- Nokizaru Shuriken
            {itemid = 17823, droprate = 217},-- Shinsoku
            {itemid = 17575, droprate = 43}, -- Somnus Signa
        },
        {
            {itemid = 722, droprate = 94},   -- Divine Log
            {itemid = 1446, droprate = 196}, -- Lacquer Tree Log
            {itemid = 703, droprate = 572},  -- Petrified Log
            {itemid = 831, droprate = 43},   -- Square Of Shining Cloth
        },
        {
            {itemid = 1442, droprate = 159}, -- Oblation Abjuration
            {itemid = 17695, droprate = 151},-- Bayards Sword
            {itemid = 18088, droprate = 167},-- Dreizack
            {itemid = 17576, droprate = 95}, -- Grim Staff
            {itemid = 17245, droprate = 95}, -- Grosveneurs Bow
            {itemid = 17996, droprate = 56}, -- Stylet
            {itemid = 17789, droprate = 341},-- Unsho
        },
        {
            {itemid = 4486, droprate = 522}, -- Dragon Heart
            {itemid = 4272, droprate = 346}, -- Slice Of Dragon Meat
            {itemid = 17928, droprate = 82}, -- Juggernaut
            {itemid = 13189, droprate = 59}, -- Speed Belt
        },
        {
            {itemid = 887, droprate = 32},   -- Coral Fragment
            {itemid = 645, droprate = 71},   -- Chunk Of Darksteel Ore
            {itemid = 902, droprate = 79},   -- Demon Horn
            {itemid = 702, droprate = 56},   -- Ebony Log
            {itemid = 737, droprate = 71},   -- Chunk Of Gold Ore
            {itemid = 823, droprate = 32},   -- Spool Of Gold Thread
            {itemid = 4173, droprate = 48},  -- Hi-reraiser
            {itemid = 700, droprate = 127},  -- Mahogany Log
            {itemid = 644, droprate = 111},  -- Chunk Of Mythril Ore
            {itemid = 703, droprate = 183},  -- Petrified Log
            {itemid = 942, droprate = 40},   -- Philosophers Stone
            {itemid = 738, droprate = 56},   -- Chunk Of Platinum Ore
            {itemid = 895, droprate = 24},   -- Ram Horn
            {itemid = 1132, droprate = 119}, -- Square Of Raxa
            {itemid = 4172, droprate = 56},  -- Reraiser
            {itemid = 4175, droprate = 40},  -- Vile Elixir +1
            {itemid = 866, droprate = 24},   -- Handful Of Wyvern Scales
        },
        {
            {itemid = 1526, droprate = 210}, -- Wyrm Beard
            {itemid = 1313, droprate = 775}, -- Lock Of Sirens Hair
        },
        {
            {itemid = 4209, droprate = 94},  -- Mind Potion
            {itemid = 4207, droprate = 130}, -- Intelligence Potion
            {itemid = 4211, droprate = 116}, -- Charisma Potion
            {itemid = 4213, droprate = 51},  -- Icarus Wing
            {itemid = 1132, droprate = 246}, -- Square Of Raxa
            {itemid = 17582, droprate = 246},-- Prelatic Pole
        },
        {
            {itemid = 4135, droprate = 290}, -- Hi-ether +3
            {itemid = 4119, droprate = 225}, -- Hi-potion +3
            {itemid = 4173, droprate = 210}, -- Hi-reraiser
            {itemid = 4175, droprate = 217}, -- Vile Elixir +1
        },
        {
            {itemid = 887, droprate = 87},   -- Coral Fragment
            {itemid = 645, droprate = 80},   -- Chunk Of Darksteel Ore
            {itemid = 902, droprate = 58},   -- Demon Horn
            {itemid = 702, droprate = 72},   -- Ebony Log
            {itemid = 737, droprate = 87},   -- Chunk Of Gold Ore
            {itemid = 823, droprate = 14},   -- Spool Of Gold Thread
            {itemid = 4173, droprate = 22},  -- Hi-reraiser
            {itemid = 700, droprate = 80},   -- Mahogany Log
            {itemid = 644, droprate = 36},   -- Chunk Of Mythril Ore
            {itemid = 703, droprate = 145},  -- Petrified Log
            {itemid = 844, droprate = 7},    -- Phoenix Feather
            {itemid = 738, droprate = 51},   -- Chunk Of Platinum Ore
            {itemid = 830, droprate = 29},   -- Square Of Rainbow Cloth
            {itemid = 895, droprate = 36},   -- Ram Horn
            {itemid = 1132, droprate = 72},  -- Square Of Raxa
            {itemid = 4172, droprate = 29},  -- Reraiser
            {itemid = 4174, droprate = 29},  -- Vile Elixir
            {itemid = 4175, droprate = 7},   -- Vile Elixir +1
            {itemid = 866, droprate = 22},   -- Handful Of Wyvern Scales
        },
        {
            {itemid = 1110, droprate = 58},  -- Vial Of Black Beetle Blood
            {itemid = 836, droprate = 36},   -- Square Of Damascene Cloth
            {itemid = 658, droprate = 72},   -- Damascus Ingot
            {itemid = 837, droprate = 22},   -- Spool Of Malboro Fiber
            {itemid = 942, droprate = 275},  -- Philosophers Stone
            {itemid = 844, droprate = 196},  -- Phoenix Feather
            {itemid = 1132, droprate = 225}, -- Square Of Raxa
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
