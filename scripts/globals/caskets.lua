-----------------------------------------------------------
-- Global Casket utility script
-----------------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

-----------------------------------------------
-- Notes:
-----------------------------------------------
-- chest MiD's
-- 960  -- Basic Chest
-- 965  -- Blue Casket
-- 966  -- Brown Casket
-- 967  -- Bronze
-- 968  -- Red
-- 969  -- Gold
-- 1524 -- Odd Chest
-- 1932 -- Black with Red chest
-- 2425 -- Black with Red chest 2
-----------------------------------------------

dsp = dsp or {}
dsp.caskets = dsp.caskets or {}

local casketInfo =
{
    spawnStatus =
    {
        DESPAWNED      = 0,
        SPAWNED_CLOSED = 1,
        SPAWNED_OPEN   = 2,
    },
    messageOffset =
    {
        NO_COMBINATION           = 6,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 8,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 9,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 10, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 11, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 12, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 13, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 14, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 15, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 16, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 17, -- You have a hunch that the second digit is ≺NUMBER BEFORE REAL NUMBER≻, ≺REAL NUMBER≻, or ≺NUMBER AFTER REAL NUMBER≻.
        FIRST_DIGIT_IS           = 18, -- You have a hunch that the first digit is ≺NUMBER BEFORE REAL NUMBER≻, ≺REAL NUMBER≻, or ≺NUMBER AFTER REAL NUMBER≻.
        UNABLE_TO_GET_HINT       = 19, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 21, -- The monster was concealing a treasure chest!
    },
    casketZones =
    {
        100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111,
        112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123,
        124, 125, 126, 127, 128, 130, 153, 157, 158, 159, 160, 166,
        167, 169, 172, 173, 174, 176, 177, 178, 184, 190, 191, 192,
        193, 194, 195, 196, 197, 198, 204, 205, 207, 212, 213
    },
    cs =
    {
        [0]  = 1000, [1]  = 1003, [2]  = 1006, [3]  = 1009, [4]  = 1012, [5]  = 1015,
        [6]  = 1018, [7]  = 1021, [8]  = 1024, [9]  = 1027, [10] = 1030, [11] = 1033,
        [12] = 1036, [13] = 1039, [14] = 1042, [15] = 1045, [16] = 1048
    },
    dropTypes =
    {
        [1]  = "tempItems",
        [2]  = "items",
        [3]  = "evolith" -- NOTE: not implemented! item id: 2783
    },
    evolithAugs =
    {
        -- TODO: find all augments for evoliths.
    },
}

local casketItems =
{
    [dsp.zone.WEST_RONFAURE] =
    {
        regionalItems = {15834}, -- Blind Ring
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1060, 4112}, -- Potion
            { 790, 4113}, -- Potion +1
            { 425, 4114}, -- Potion +2
            {1040, 4128}, -- Ether
            { 760, 4129}, -- Ether +1
            { 420, 4130}, -- Ether +2
            { 600, 4145}, -- Elixer
            { 820, 4148}, -- Antidote
            { 730, 4150}, -- Eye Drops
            { 750, 4151}, -- Echo Drops
            { 350, 4155}, -- Remedy
            {1020, 4164}, -- Prism Powder
            { 940, 4165}, -- Silent Oil
            { 420, 4202}, -- Daedalus Wing
            { 660, 4300}, -- Apple Au Lait
            { 250, 4423}, -- Apple Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1700,   505}, -- Sheepskin
            {4500,   640}, -- Copper Ore
            {2500,   641}, -- Tin Ore
            {3450,   642}, -- Zinc Ore
            {2000,   688}, -- Arrowwood Log
            {1020,   698}, -- Ash Log
            {4200,   656}, -- Beastcoin
            {5000,   768}, -- Flint Stone
            {1250,   818}, -- Cotton Thread
            {1300,   833}, -- Moko Grass
            { 800,   840}, -- Chocobo Feather
            {3600,   846}, -- Insect Wing
            {3000,   912}, -- Beehive Chip
            { 700,   943}, -- Poison Dust
            {2400,  1214}, -- Handful of Stone Arrowheads x33
            {4900,  4112}, -- Potion
            {3590,  4148}, -- Antidote
            {1150,  4150}, -- Eye Drops
            {1360,  4151}, -- Echo Drops
            {2900,  4370}, -- Honey
            { 600, 12290}, -- Maple Shield
            { 495, 12440}, -- Leather Bandana
            { 450, 12449}, -- Brass Cap
            { 190, 12456}, -- Hachimaki
            { 530, 12608}, -- Tunic
            { 460, 12696}, -- Leather Gloves
            { 340, 12705}, -- Brass Mittens
            { 168, 12712}, -- Tekko
            { 310, 12736}, -- Mitts
            { 475, 12824}, -- Leather Trousers
            { 280, 12833}, -- Brass Subligar
            { 235, 12840}, -- Sitabaki
            { 422, 12864}, -- Slacks
            { 250, 12961}, -- Brass Leggings
            { 287, 12992}, -- Solea
            { 500, 13081}, -- Leather Gorget
            { 300, 16407}, -- Brass Baghnakhs
            { 120, 16530}, -- Xiphos
            { 320, 17050}, -- Willow Wand
        }
    },
    [dsp.zone.EAST_RONFAURE] =
    {
        regionalItems = {19157}, -- Surviver
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
         ----------------------------------
            {1060, 4112}, -- Potion
            { 790, 4113}, -- Potion +1
            { 425, 4114}, -- Potion +2
            {1040, 4128}, -- Ether
            { 760, 4129}, -- Ether +1
            { 420, 4130}, -- Ether +2
            { 600, 4145}, -- Elixer
            { 820, 4148}, -- Antidote
            { 730, 4150}, -- Eye Drops
            { 750, 4151}, -- Echo Drops
            { 350, 4155}, -- Remedy
            {1020, 4164}, -- Prism Powder
            { 940, 4165}, -- Silent Oil
            { 420, 4202}, -- Daedalus Wing
            { 660, 4300}, -- Apple Au Lait
            { 250, 4423}, -- Apple Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
         ----------------------------------
            {1700,   505}, -- Sheepskin
            {4500,   640}, -- Copper Ore
            {2500,   641}, -- Tin Ore
            {3450,   642}, -- Zinc Ore
            {2000,   688}, -- Arrowwood Log
            {1020,   698}, -- Ash Log
            {4200,   656}, -- Beastcoin
            {5000,   768}, -- Flint Stone
            {1250,   818}, -- Cotton Thread
            {1300,   833}, -- Moko Grass
            { 800,   840}, -- Chocobo Feather
            {3600,   846}, -- Insect Wing
            {3000,   912}, -- Beehive Chip
            { 700,   943}, -- Poison Dust
            {2400,  1214}, -- Handful of Stone Arrowheads x33
            {4900,  4112}, -- Potion
            {3590,  4148}, -- Antidote
            {1150,  4150}, -- Eye Drops
            {1360,  4151}, -- Echo Drops
            {2900,  4370}, -- Honey
            { 600, 12290}, -- Maple Shield
            { 495, 12440}, -- Leather Bandana
            { 450, 12449}, -- Brass Cap
            { 190, 12456}, -- Hachimaki
            { 530, 12608}, -- Tunic
            { 460, 12696}, -- Leather Gloves
            { 340, 12705}, -- Brass Mittens
            { 168, 12712}, -- Tekko
            { 310, 12736}, -- Mitts
            { 475, 12824}, -- Leather Trousers
            { 280, 12833}, -- Brass Subligar
            { 235, 12840}, -- Sitabaki
            { 422, 12864}, -- Slacks
            { 250, 12961}, -- Brass Leggings
            { 287, 12992}, -- Solea
            { 500, 13081}, -- Leather Gorget
            { 300, 16407}, -- Brass Baghnakhs
            { 120, 16530}, -- Xiphos
            { 320, 17050}, -- Willow Wand
        }
    },
    [dsp.zone.LA_THEINE_PLATEAU] =
    {
        regionalItems = {15835}, -- Desperado Ring
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1060, 4112}, -- Potion
            { 790, 4113}, -- Potion +1
            { 425, 4114}, -- Potion +2
            {1040, 4128}, -- Ether
            { 760, 4129}, -- Ether +1
            { 420, 4130}, -- Ether +2
            { 600, 4145}, -- Elixer
            { 820, 4148}, -- Antidote
            { 730, 4150}, -- Eye Drops
            { 750, 4151}, -- Echo Drops
            { 350, 4155}, -- Remedy
            {1020, 4164}, -- Prism Powder
            { 940, 4165}, -- Silent Oil
            { 420, 4202}, -- Daedalus Wing
            { 660, 4300}, -- Apple Au Lait
            { 250, 4423}, -- Apple Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1700,   626}, -- Black Pepper
            {2500,   641}, -- Tin Ore
            {2000,   688}, -- Arrowwood Log
            {1020,   727}, -- Dogwood Log
            {4200,   750}, -- Silver Beastcoin
            {5000,   768}, -- Flint Stone
            {3600,   846}, -- Insect Wing
            {1300,   893}, -- Giant Femur
            {3000,   912}, -- Beehive Chip
            {1400,   925}, -- Giant Stinger
            {4300,   953}, -- Treant Bulb
            {2200,  1215}, -- Handful of Bone Arrowheads x33
            {4000,  1845}, -- Red Moko Grass
            {4900,  4112}, -- Potion
            {3750,  4128}, -- Ether
            {3250,  4148}, -- Antidote
            {1150,  4151}, -- Echo Drops
            {2100,  4227}, -- Bronze Bolt Quiver
            {2060,  4509}, -- Distilled Water
            { 425, 12432}, -- Faceguard
            { 760, 12449}, -- Brass Cap
            { 590, 12473}, -- Poet's Circlet
            { 630, 12601}, -- Linen Robe
            { 765, 12705}, -- Brass Mittens
            { 465, 12710}, -- Bone Mittens
            { 460, 12720}, -- Gloves
            { 430, 12729}, -- Linen Cuffs
            { 275, 12816}, -- Scale Cuisses
            { 730, 12834}, -- Bone Subligar
            { 600, 12848}, -- Brais
            { 535, 12688}, -- Scale Finger Gauntlets
            { 375, 12857}, -- Linen Slops
            { 410, 12966}, -- Bone Leggings
            { 655, 12976}, -- Gaiters
            { 425, 12985}, -- Holly Clogs
            { 390, 16466}, -- Knife
            { 370, 16531}, -- Brass Xiphos
            { 380, 17096}, -- Holly Pole
            {2320, 17316}, -- Bomb Arm
        }
    },
    [dsp.zone.VALKURM_DUNES] =
    {
        regionalItems = {16367}, -- Phlegethon's Trousers
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1060, 4112}, -- Potion
            { 740, 4113}, -- Potion +1
            { 700, 4114}, -- Potion +2
            { 800, 4128}, -- Ether
            { 430, 4129}, -- Ether +1
            {  50, 4130}, -- Ether +2
            { 900, 4145}, -- Elixer
            { 820, 4148}, -- Antidote
            { 730, 4150}, -- Eye Drops
            { 850, 4151}, -- Echo Drops
            { 650, 4155}, -- Remedy
            {1020, 4164}, -- Prism Powder
            { 940, 4165}, -- Silent Oil
            {0000, 4202}, -- Daedalus Wing
            {0000, 4206}, -- Catholicon
            { 650, 4301}, -- Pear Au Lait
            { 250, 4425}, -- Tomato Juice
        },
        items =
        {
            ----------------------------------
            --| Weight | Item ID |   Name  |--
            ----------------------------------
            {0000,   642}, -- Zinc Ore
            {0000,   689}, -- Lauan Log
            {0000,   693}, -- Walnut Log
            {0000,   736}, -- Silver Ore
            {0000,   835}, -- Flax Flower
            {0000,   847}, -- Bird Feather
            {0000,   898}, -- Chicken Bone
            {0000,   914}, -- Mercury
            {0000,   936}, -- Rock Salt
            {0000,   947}, -- Firesand
            {0000,  1108}, -- Sulfur
            {0000,  1211}, -- Handful of Bronze Bolt Heads x33
            {0000,  4113}, -- Potion +1
            {0000,  4128}, -- Ether
            {0000,  4148}, -- Antidote
            {0000,  4151}, -- Echo Drops
            {0000,  4373}, -- Woozyshroom
            {0000, 16643}, -- Battleaxe
            {0000, 12455}, -- Beetle Mask
            {0000, 12583}, -- Beetle Harness
            {0000, 12711}, -- Beetle Mittens
            {0000, 12835}, -- Beetle Subligar
            {0000, 12967}, -- Beetle Leggings
            {0000, 12865}, -- Black Slacks
            {0000, 12966}, -- Bone Leggings
            {0000, 12454}, -- Bone Mask
            {0000, 12710}, -- Bone Mittens
            {0000, 12834}, -- Bone Subligar
            {0000, 13584}, -- Cotton Cape
            {0000, 13588}, -- Dhalmel Mantle
            {0000, 12985}, -- Holly Clogs
            {0000, 16473}, -- Kukri
            {0000, 12729}, -- Linen Cuffs
            {0000, 12857}, -- Linen Slops
            {0000, 12697}, -- Lizard Gloves
            {0000, 12441}, -- Lizard Helm
            {0000, 12953}, -- Lizard Ledelsens
            {0000, 12825}, -- Lizard Trousers
            {0000, 12473}, -- Poet's Circlet
            {0000, 12993}, -- Sandals
            {0000, 12737}, -- White Mitts
        }
    },
    [dsp.zone.JUGNER_FOREST] =
    {
        regionalItems = {15927}, -- Pinwheel Belt
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000, 4114}, -- Potion +2
            {0000, 4115}, -- Potion +3
            {0000, 4116}, -- Hi-Potion
            {0000, 4129}, -- Ether +1
            {0000, 4130}, -- Ether +2
            {0000, 4131}, -- Ether +3
            {0000, 4136}, -- Super Ether
            {0000, 4145}, -- Elixer
            {0000, 4148}, -- Antidote
            {0000, 4150}, -- Eye Drops
            {0000, 4151}, -- Echo Drops
            {0000, 4155}, -- Remedy
            {0000, 4164}, -- Prism Powder
            {0000, 4165}, -- Silent Oil
            {0000, 4202}, -- Daedalus Wing
            {0000, 4206}, -- Catholicon
            {0000, 4302}, -- Pamama Au Lait
            {0000, 4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   642}, -- Zinc Ore
            {0000,   689}, -- Lauan Log
            {0000,   693}, -- Walnut Log
            {0000,   736}, -- Silver Ore
            {0000,   835}, -- Flax Flower
            {0000,   847}, -- Bird Feather
            {0000,   898}, -- Chicken Bone
            {0000,   914}, -- Mercury
            {0000,   936}, -- Rock Salt
            {0000,   947}, -- Firesand
            {0000,  1108}, -- Sulfur
            {0000,  1211}, -- Handful of Bronze Bolt Heads x33
            {0000,  4113}, -- Potion +1
            {0000,  4128}, -- Ether
            {0000,  4148}, -- Antidote
            {0000,  4151}, -- Echo Drops
            {0000,  4373}, -- Woozyshroom
            {0000, 16643}, -- Battleaxe
            {0000, 12455}, -- Beetle Mask
            {0000, 12583}, -- Beetle Harness
            {0000, 12711}, -- Beetle Mittens
            {0000, 12835}, -- Beetle Subligar
            {0000, 12967}, -- Beetle Leggings
            {0000, 12865}, -- Black Slacks
            {0000, 12966}, -- Bone Leggings
            {0000, 12454}, -- Bone Mask
            {0000, 12710}, -- Bone Mittens
            {0000, 12834}, -- Bone Subligar
            {0000, 13584}, -- Cotton Cape
            {0000, 13588}, -- Dhalmel Mantle
            {0000, 12985}, -- Holly Clogs
            {0000, 16473}, -- Kukri
            {0000, 12729}, -- Linen Cuffs
            {0000, 12857}, -- Linen Slops
            {0000, 12697}, -- Lizard Gloves
            {0000, 12441}, -- Lizard Helm
            {0000, 12953}, -- Lizard Ledelsens
            {0000, 12825}, -- Lizard Trousers
            {0000, 12473}, -- Poet's Circlet
            {0000, 12993}, -- Sandals
            {0000, 12737}, -- White Mitts
        }
    },
    [dsp.zone.BATALLIA_DOWNS] =
    {
        regionalItems = {18451}, -- Mokusa
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000, 4114}, -- Potion +2
            {0000, 4115}, -- Potion +3
            {0000, 4116}, -- Hi-Potion
            {0000, 4129}, -- Ether +1
            {0000, 4130}, -- Ether +2
            {0000, 4131}, -- Ether +3
            {0000, 4136}, -- Super Ether
            {0000, 4145}, -- Elixer
            {0000, 4148}, -- Antidote
            {0000, 4150}, -- Eye Drops
            {0000, 4151}, -- Echo Drops
            {0000, 4155}, -- Remedy
            {0000, 4164}, -- Prism Powder
            {0000, 4165}, -- Silent Oil
            {0000, 4202}, -- Daedalus Wing
            {0000, 4206}, -- Catholicon
            {0000, 4302}, -- Pamama Au Lait
            {0000, 4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   573}, -- Vegetable Seeds
            {0000,   636}, -- Chamomile
            {0000,   643}, -- Iron Ore
            {0000,   644}, -- Mythril Ore
            {0000,   691}, -- Maple Log
            {0000,   694}, -- Chestnut Log
            {0000,   749}, -- Mythril Beastcoin
            {0000,   820}, -- Wool Thread
            {0000,   859}, -- Ram Skin
            {0000,   895}, -- Ram Horn
            {0000,   928}, -- Bomb Ash
            {0000,   943}, -- Poison Dust
            {0000,  1212}, -- Handful of Mythril Bolt Heads x33
            {0000,  4113}, -- Potion +1
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4145}, -- Elixer
            {0000, 12300}, -- Targe
            {0000, 12433}, -- Brass Mask
            {0000, 12442}, -- Studded Bandana
            {0000, 12465}, -- Cotton Headgear
            {0000, 12474}, -- Wool Hat
            {0000, 12570}, -- Studded Vest
            {0000, 12689}, -- Brass Finger Gauntlets
            {0000, 12721}, -- Cotton Gloves
            {0000, 12817}, -- Brass Cuisses
            {0000, 12826}, -- Studded Trousers
            {0000, 12849}, -- Cotton Brais
            {0000, 12945}, -- Brass Greaves
            {0000, 12954}, -- Studded Boots
            {0000, 12977}, -- Cotton Gaiters
            {0000, 12986}, -- Chestnut Sabots
            {0000, 13085}, -- Hemp Gorget
            {0000, 13205}, -- Silver Obi
            {0000, 13328}, -- Mythril Earring
            {0000, 13446}, -- Mythril Ring
            {0000, 16467}, -- Mythril Knife
            {0000, 17097}, -- Elm Pole
            {0000, 17284}, -- Chakram
        }
    },
    [dsp.zone.NORTH_GUSTABERG] =
    {
        regionalItems = {11312}, -- Rambler's Cloak
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1060, 4112}, -- Potion
            { 740, 4113}, -- Potion +1
            { 700, 4114}, -- Potion +2
            { 800, 4128}, -- Ether
            { 430, 4129}, -- Ether +1
            {  50, 4130}, -- Ether +2
            { 900, 4145}, -- Elixer
            { 820, 4148}, -- Antidote
            { 730, 4150}, -- Eye Drops
            { 850, 4151}, -- Echo Drops
            { 650, 4155}, -- Remedy
            {1020, 4164}, -- Prism Powder
            { 940, 4165}, -- Silent Oil
            { 420, 4202}, -- Daedalus Wing
            { 660, 4300}, -- Apple Au Lait
            { 250, 4423}, -- Apple Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1700,   505}, -- Sheepskin
            {4500,   640}, -- Copper Ore
            {2500,   641}, -- Tin Ore
            {3450,   642}, -- Zinc Ore
            {2000,   688}, -- Arrowwood Log
            {1020,   698}, -- Ash Log
            {4200,   656}, -- Beastcoin
            {5000,   768}, -- Flint Stone
            {1250,   818}, -- Cotton Thread
            {1300,   833}, -- Moko Grass
            { 800,   840}, -- Chocobo Feather
            {3600,   846}, -- Insect Wing
            {3000,   912}, -- Beehive Chip
            { 700,   943}, -- Poison Dust
            {2400,  1214}, -- Handful of Stone Arrowheads x33
            {4900,  4112}, -- Potion
            {3590,  4148}, -- Antidote
            {1150,  4150}, -- Eye Drops
            {1360,  4151}, -- Echo Drops
            {2900,  4370}, -- Honey
            { 600, 12290}, -- Maple Shield
            { 295, 12440}, -- Leather Bandana
            { 450, 12449}, -- Brass Cap
            { 290, 12456}, -- Hachimaki
            { 530, 12608}, -- Tunic
            { 460, 12696}, -- Leather Gloves
            { 340, 12705}, -- Brass Mittens
            { 168, 12712}, -- Tekko
            { 310, 12736}, -- Mitts
            { 475, 12824}, -- Leather Trousers
            {  80, 12833}, -- Brass Subligar
            { 235, 12840}, -- Sitabaki
            { 422, 12864}, -- Slacks
            { 135, 12952}, -- Leather Highboots
            { 250, 12961}, -- Brass Leggings
            { 255, 12968}, -- Kyahan
            { 287, 12992}, -- Solea
            { 500, 13081}, -- Leather Gorget
            { 300, 16407}, -- Brass Baghnakhs
            { 120, 16530}, -- Xiphos
            { 320, 17050}, -- Willow Wand
        }
    },
    [dsp.zone.SOUTH_GUSTABERG] =
    {
        regionalItems = {15926}, -- Bronze Bandolier
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1060, 4112}, -- Potion
            { 740, 4113}, -- Potion +1
            { 700, 4114}, -- Potion +2
            { 800, 4128}, -- Ether
            { 430, 4129}, -- Ether +1
            {  50, 4130}, -- Ether +2
            { 900, 4145}, -- Elixer
            { 820, 4148}, -- Antidote
            { 730, 4150}, -- Eye Drops
            { 850, 4151}, -- Echo Drops
            { 650, 4155}, -- Remedy
            {1020, 4164}, -- Prism Powder
            { 940, 4165}, -- Silent Oil
            { 420, 4202}, -- Daedalus Wing
            { 660, 4300}, -- Apple Au Lait
            { 250, 4423}, -- Apple Juice

        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1700,   505}, -- Sheepskin
            {4500,   640}, -- Copper Ore
            {2500,   641}, -- Tin Ore
            {3450,   642}, -- Zinc Ore
            {2000,   688}, -- Arrowwood Log
            {1020,   698}, -- Ash Log
            {4200,   656}, -- Beastcoin
            {5000,   768}, -- Flint Stone
            {1250,   818}, -- Cotton Thread
            {1300,   833}, -- Moko Grass
            { 800,   840}, -- Chocobo Feather
            {3600,   846}, -- Insect Wing
            {3000,   912}, -- Beehive Chip
            { 700,   943}, -- Poison Dust
            {2400,  1214}, -- Handful of Stone Arrowheads x33
            {4900,  4112}, -- Potion
            {3590,  4148}, -- Antidote
            {1150,  4150}, -- Eye Drops
            {1360,  4151}, -- Echo Drops
            {2900,  4370}, -- Honey
            { 600, 12290}, -- Maple Shield
            { 295, 12440}, -- Leather Bandana
            { 450, 12449}, -- Brass Cap
            { 290, 12456}, -- Hachimaki
            { 530, 12608}, -- Tunic
            { 460, 12696}, -- Leather Gloves
            { 340, 12705}, -- Brass Mittens
            { 168, 12712}, -- Tekko
            { 310, 12736}, -- Mitts
            { 475, 12824}, -- Leather Trousers
            {  80, 12833}, -- Brass Subligar
            { 235, 12840}, -- Sitabaki
            { 422, 12864}, -- Slacks
            { 135, 12952}, -- Leather Highboots
            { 250, 12961}, -- Brass Leggings
            { 255, 12968}, -- Kyahan
            { 287, 12992}, -- Solea
            { 500, 13081}, -- Leather Gorget
            { 300, 16407}, -- Brass Baghnakhs
            { 120, 16530}, -- Xiphos
            { 320, 17050}, -- Willow Wand

        }
    },
    [dsp.zone.KONSCHTAT_HIGHLANDS] =
    {
        regionalItems = {19223}, -- Attar Of Roses
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1060, 4112}, -- Potion
            { 740, 4113}, -- Potion +1
            { 700, 4114}, -- Potion +2
            { 800, 4128}, -- Ether
            { 430, 4129}, -- Ether +1
            {  50, 4130}, -- Ether +2
            { 900, 4145}, -- Elixer
            { 820, 4148}, -- Antidote
            { 730, 4150}, -- Eye Drops
            { 850, 4151}, -- Echo Drops
            { 650, 4155}, -- Remedy
            {1020, 4164}, -- Prism Powder
            { 940, 4165}, -- Silent Oil
            { 420, 4202}, -- Daedalus Wing
            {0000, 4301}, -- Pear Au Lait
            {0000, 4425}, -- Tomato Juice

        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   626}, -- Black Pepper
            {0000,   641}, -- Tin Ore
            {0000,   688}, -- Arrowwood Log
            {0000,   727}, -- Dogwood Log
            {0000,   750}, -- Silver Beastcoin
            {0000,   768}, -- Flint Stone
            {0000,   846}, -- Insect Wing
            {0000,   893}, -- Giant Femur
            {0000,   912}, -- Beehive Chip
            {0000,   925}, -- Giant Stinger
            {0000,   953}, -- Treant Bulb
            {0000,  1215}, -- Handful of Bone Arrowheads x33
            {0000,  1845}, -- Red Moko Grass
            {0000,  4112}, -- Potion
            {0000,  4128}, -- Ether
            {0000,  4145}, -- Elixer
            {0000,  4148}, -- Antidote
            {0000,  4151}, -- Echo Drops
            {0000,  4227}, -- Bronze Bolt Quiver
            {0000,  4509}, -- Distilled Water
            {0000, 12432}, -- Faceguard
            {0000, 12449}, -- Brass Cap
            {0000, 12473}, -- Poet's Circlet
            {0000, 12601}, -- Linen Robe
            {0000, 12688}, -- Scale Finger Gauntlets
            {0000, 12705}, -- Brass Mittens
            {0000, 12710}, -- Bone Mittens
            {0000, 12720}, -- Gloves
            {0000, 12729}, -- Linen Cuffs
            {0000, 12816}, -- Scale Cuisses
            {0000, 12834}, -- Bone Subligar
            {0000, 12848}, -- Brais
            {0000, 12857}, -- Linen Slops
            {0000, 12966}, -- Bone Leggings
            {0000, 12976}, -- Gaiters
            {0000, 12985}, -- Holly Clogs
            {0000, 16466}, -- Knife
            {0000, 16531}, -- Brass Xiphos
            {0000, 17096}, -- Holly Pole
            {0000, 17316}, -- Bomb Arm
        }
    },
    [dsp.zone.PASHHOW_MARSHLANDS] =
    {
        regionalItems = {19222}, -- Wurger
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000, 4114}, -- Potion +2
            {0000, 4115}, -- Potion +3
            {0000, 4116}, -- Hi-Potion
            {0000, 4129}, -- Ether +1
            {0000, 4130}, -- Ether +2
            {0000, 4131}, -- Ether +3
            {0000, 4136}, -- Super Ether
            {0000, 4145}, -- Elixir
            {0000, 4148}, -- Antidote
            {0000, 4150}, -- Eye Drops
            {0000, 4151}, -- Echo Drops
            {0000, 4155}, -- Remedy
            {0000, 4164}, -- Prism Powder
            {0000, 4165}, -- Silent Oil
            {0000, 4202}, -- Daedalus Wing
            {0000, 4206}, -- Catholicon
            {0000, 4302}, -- Pamama Au Lait
            {0000, 4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   627}, -- Maple Sugar
            {0000,   637}, -- Slime Oil
            {0000,   643}, -- Iron Ore
            {0000,   690}, -- Elm Log
            {0000,   816}, -- Silk Thread
            {0000,   835}, -- Flax Flower
            {0000,   857}, -- Dhalmel Hide
            {0000,   880}, -- Bone Chip
            {0000,   897}, -- Scorpion Claw
            {0000,   900}, -- Fish Bones
            {0000,   913}, -- Beeswax
            {0000,   943}, -- Poison Dust
            {0000,  1211}, -- Brz. Bolt Heads
            {0000,  4112}, -- Potion
            {0000,  4114}, -- Potion +2
            {0000,  4128}, -- Ether
            {0000,  4129}, -- Ether +1
            {0000,  4145}, -- Elixir
            {0000,  4151}, -- Echo Drops
            {0000,  4225}, -- Iron Quiver
            {0000,  4447}, -- Scream Fungus
            {0000, 12424}, -- Iron Mask
            {0000, 12441}, -- Lizard Helm
            {0000, 12455}, -- Beetle Mask
            {0000, 12552}, -- Chainmail
            {0000, 12593}, -- Cotton Doublet
            {0000, 12680}, -- Chain Mittens
            {0000, 12697}, -- Lizard Gloves
            {0000, 12711}, -- Beetle Mittens
            {0000, 12721}, -- Cotton Gloves
            {0000, 12737}, -- White Mitts
            {0000, 12825}, -- Lizard Trousers
            {0000, 12849}, -- Cotton Brais
            {0000, 12865}, -- Black Slacks
            {0000, 12953}, -- Lizard Ledelsens
            {0000, 12967}, -- Beetle Leggings
            {0000, 12977}, -- Cotton Gaiters
            {0000, 12993}, -- Sandals
            {0000, 16406}, -- Baghnakhs
            {0000, 16835}, -- Spear
            {0000, 17090}, -- Elm Staff
        }
    },
    [dsp.zone.ROLANBERRY_FIELDS] =
    {
        regionalItems = {11401}, -- Rambler's Gaiters
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4116}, -- Hi-Potion
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4131}, -- Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice

        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   627}, -- Maple Sugar
            {0000,   637}, -- Slime Oil
            {0000,   643}, -- Iron Ore
            {0000,   690}, -- Elm Log
            {0000,   816}, -- Silk Thread
            {0000,   835}, -- Flax Flower
            {0000,   857}, -- Dhalmel Hide
            {0000,   880}, -- Bone Chip
            {0000,   897}, -- Scorpion Claw
            {0000,   900}, -- Fish Bones
            {0000,   913}, -- Beeswax
            {0000,   943}, -- Poison Dust
            {0000,  1211}, -- Brz. Bolt Heads
            {0000,  4112}, -- Potion
            {0000,  4114}, -- Potion +2
            {0000,  4128}, -- Ether
            {0000,  4129}, -- Ether +1
            {0000,  4151}, -- Echo Drops
            {0000,  4225}, -- Iron Quiver
            {0000,  4447}, -- Scream Fungus
            {0000, 12424}, -- Iron Mask
            {0000, 12441}, -- Lizard Helm
            {0000, 12455}, -- Beetle Mask
            {0000, 12552}, -- Chainmail
            {0000, 12593}, -- Cotton Doublet
            {0000, 12602}, -- Wool Robe
            {0000, 12680}, -- Chain Mittens
            {0000, 12697}, -- Lizard Gloves
            {0000, 12711}, -- Beetle Mittens
            {0000, 12721}, -- Cotton Gloves
            {0000, 12737}, -- White Mitts
            {0000, 12825}, -- Lizard Trousers
            {0000, 12849}, -- Cotton Brais
            {0000, 12865}, -- Black Slacks
            {0000, 12953}, -- Lizard Ledelsens
            {0000, 12967}, -- Beetle Leggings
            {0000, 12977}, -- Cotton Gaiters
            {0000, 12993}, -- Sandals
            {0000, 16406}, -- Baghnakhs
            {0000, 16835}, -- Spear
            {0000, 17090}, -- Elm Staff
        }
    },
    [dsp.zone.BEAUCEDINE_GLACIER] =
    {
        regionalItems = {16280}, -- Haraldr's Muffler
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   575}, -- Grain Seeds
            {0000,   612}, -- Kazham Peppers
            {0000,   644}, -- Mythril Ore
            {0000,   699}, -- Oak Log
            {0000,   819}, -- Linen Thread
            {0000,   845}, -- Black C. Feather
            {0000,   914}, -- Mercury
            {0000,  1217}, -- Slv. Arrowheads
            {0000,  4113}, -- Potion +1
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4128}, -- Ether
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4145}, -- Elixir
            {0000, 12450}, -- Padded Cap
            {0000, 12475}, -- Velvet Hat
            {0000, 12571}, -- Cuir Bouilli
            {0000, 12699}, -- Cuir Gloves
            {0000, 12706}, -- Iron Mittens
            {0000, 12731}, -- Velvet Cuffs
            {0000, 12827}, -- Cuir Trousers
            {0000, 12836}, -- Iron Subligar
            {0000, 12859}, -- Velvet Slops
            {0000, 12955}, -- Cuir Highboots
            {0000, 12987}, -- Ebony Sabots
        }
    },
    [dsp.zone.XARCABARD] =
    {
        regionalItems = {15042}, -- Gothic Gauntlets
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   575}, -- Grain Seeds
            {0000,   612}, -- Kazham Peppers
            {0000,   698}, -- Ash Log
            {0000,   816}, -- Silk Thread
            {0000,   923}, -- Dryad Root
            {0000,   932}, -- Carbon Fiber
            {0000,  1225}, -- Gold Nugget
            {0000,  1228}, -- Dst. Nugget
            {0000,  4113}, -- Potion +1
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4128}, -- Ether
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4145}, -- Elixir
            {0000, 12450}, -- Padded Cap
            {0000, 12837}, -- Carapace Subligar
            {0000, 13711}, -- Carapace Mask
            {0000, 13713}, -- Carapace Mittens
            {0000, 13715}, -- Cpc. Leggings
            {0000, 16412}, -- Mythril Claws
            {0000, 16558}, -- Falchion
            {0000, 16590}, -- Greatsword
            {0000, 16796}, -- Mythril Zaghnal
            {0000, 17062}, -- Bone Rod
            {0000, 17267}, -- Negoroshiki
            {0000, 17610}, -- Bone Knife
            {0000, 18207}, -- Kheten
        }
    },
    [dsp.zone.CAPE_TERIGGAN] =
    {
        regionalItems = {17965}, -- Sirocco Axe
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4137}, -- Super Ether +1
            {0000,  4144}, -- Hi-Elixir
            {0000,  4145}, -- Elixir
            {0000,  4149}, -- Panacea
            {0000,  4155}, -- Remedy
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4210}, -- Lethe Water
            {0000,  4255}, -- Mana Powder
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
            {0000,  5322}, -- Healing Powder
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   645}, -- Darksteel Ore
            {0000,   702}, -- Ebony Log
            {0000,   737}, -- Gold Ore
            {0000,   823}, -- Gold Thread
            {0000,   844}, -- Phoenix Feather
            {0000,  1443}, -- Dried Mugwort
            {0000,  4116}, -- Hi-Potion
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4141}, -- Pro-Ether +1
            {0000,  5164}, -- Ground Wasabi
            {0000, 12427}, -- Bascinet
            {0000, 12683}, -- Darksteel Mufflers
            {0000, 12740}, -- Silk Mitts
            {0000, 12811}, -- Dst. Breeches
            {0000, 12829}, -- Beak Trousers
            {0000, 12868}, -- Silk Slacks
            {0000, 12939}, -- Dst. Sollerets
            {0000, 12996}, -- Silk Pumps
            {0000, 13698}, -- Beak Helm
            {0000, 13700}, -- Beak Gloves
            {0000, 13702}, -- Beak Ledelsens
        }
    },
    [dsp.zone.EASTERN_ALTEPA_DESERT] =
    {
        regionalItems = {16251}, -- Casaba Melon Tank
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {4000,  4118}, -- Hi-Potion +2
            {2000,  4119}, -- Hi-Potion +3
            {1500,  4120}, -- X-Potion
            {4000,  4134}, -- Hi-Ether +2
            {2000,  4135}, -- Hi-Ether +3
            { 400,  4136}, -- Super Ether
            { 600,  4145}, -- Elixir
            {1450,  4148}, -- Antidote
            {1550,  4150}, -- Eye Drops
            {1650,  4151}, -- Echo Drops
            { 350,  4155}, -- Remedy
            {1820,  4164}, -- Prism Powder
            {1840,  4165}, -- Silent Oil
            {1600,  4202}, -- Daedalus Wing
            { 250,  4206}, -- Catholicon
            { 720,  4302}, -- Pamama au Lait
            {1850,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   575}, -- Grain Seeds
            {0000,   612}, -- Kazham Peppers
            {0000,   644}, -- Mythril Ore
            {0000,   699}, -- Oak Log
            {0000,   819}, -- Linen Thread
            {0000,   845}, -- Black C. Feather
            {0000,   914}, -- Mercury
            {0000,  1217}, -- Slv. Arrowheads
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000, 12443}, -- Cuir Bandana
            {0000, 12450}, -- Padded Cap
            {0000, 12699}, -- Cuir Gloves
            {0000, 12706}, -- Iron Mittens
            {0000, 12731}, -- Velvet Cuffs
            {0000, 12836}, -- Iron Subligar
            {0000, 12955}, -- Cuir Highboots
            {0000, 12962}, -- Leggings
            {0000, 12987}, -- Ebony Sabots
        }
    },
    [dsp.zone.WEST_SARUTABARUTA] =
    {
        regionalItems = {19221}, -- Firefly
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4112}, -- Potion
            {0000,  4113}, -- Potion +1
            {0000,  4114}, -- Potion +2
            {0000,  4128}, -- Ether
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4300}, -- Apple au Lait
            {0000,  4423}, -- Apple Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   505}, -- Sheepskin
            {0000,   640}, -- Copper Ore
            {0000,   641}, -- Tin Ore
            {0000,   642}, -- Zinc Ore
            {0000,   656}, -- Beastcoin
            {0000,   688}, -- Arrowwood Log
            {0000,   698}, -- Ash Log
            {0000,   768}, -- Flint Stone
            {0000,   818}, -- Cotton Thread
            {0000,   833}, -- Moko Grass
            {0000,   840}, -- Chocobo Fthr.
            {0000,   846}, -- Insect Wing
            {0000,   912}, -- Beehive Chip
            {0000,   943}, -- Poison Dust
            {0000,  1214}, -- Stone Arrowhd.
            {0000,  4112}, -- Potion
            {0000,  4113}, -- Potion +1
            {0000,  4128}, -- Ether
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4370}, -- Honey
            {0000, 12290}, -- Maple Shield
            {0000, 12440}, -- Leather Bandana
            {0000, 12449}, -- Brass Cap
            {0000, 12456}, -- Hachimaki
            {0000, 12608}, -- Tunic
            {0000, 12696}, -- Leather Gloves
            {0000, 12705}, -- Brass Mittens
            {0000, 12712}, -- Tekko
            {0000, 12736}, -- Mitts
            {0000, 12824}, -- Leather Trousers
            {0000, 12833}, -- Brass Subligar
            {0000, 12840}, -- Sitabaki
            {0000, 12864}, -- Slacks
            {0000, 12961}, -- Brass Leggings
            {0000, 12992}, -- Solea
            {0000, 13081}, -- Leather Gorget
            {0000, 16407}, -- Brass Baghnakhs
            {0000, 16530}, -- Xiphos
            {0000, 17050}, -- Willow Wand
        }
    },
    [dsp.zone.EAST_SARUTABARUTA] =
    {
        regionalItems = {16279}, -- Pile Chain
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4112}, -- Potion
            {0000,  4113}, -- Potion +1
            {0000,  4114}, -- Potion +2
            {0000,  4128}, -- Ether
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4300}, -- Apple au Lait
            {0000,  4423}, -- Apple Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   505}, -- Sheepskin
            {0000,   640}, -- Copper Ore
            {0000,   641}, -- Tin Ore
            {0000,   642}, -- Zinc Ore
            {0000,   656}, -- Beastcoin
            {0000,   688}, -- Arrowwood Log
            {0000,   698}, -- Ash Log
            {0000,   768}, -- Flint Stone
            {0000,   818}, -- Cotton Thread
            {0000,   833}, -- Moko Grass
            {0000,   840}, -- Chocobo Fthr.
            {0000,   846}, -- Insect Wing
            {0000,   912}, -- Beehive Chip
            {0000,   943}, -- Poison Dust
            {0000,  1214}, -- Stone Arrowhd.
            {0000,  4112}, -- Potion
            {0000,  4113}, -- Potion +1
            {0000,  4128}, -- Ether
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4370}, -- Honey
            {0000, 12290}, -- Maple Shield
            {0000, 12440}, -- Leather Bandana
            {0000, 12449}, -- Brass Cap
            {0000, 12456}, -- Hachimaki
            {0000, 12608}, -- Tunic
            {0000, 12696}, -- Leather Gloves
            {0000, 12705}, -- Brass Mittens
            {0000, 12712}, -- Tekko
            {0000, 12736}, -- Mitts
            {0000, 12824}, -- Leather Trousers
            {0000, 12833}, -- Brass Subligar
            {0000, 12840}, -- Sitabaki
            {0000, 12864}, -- Slacks
            {0000, 12961}, -- Brass Leggings
            {0000, 12992}, -- Solea
            {0000, 13081}, -- Leather Gorget
            {0000, 16407}, -- Brass Baghnakhs
            {0000, 16530}, -- Xiphos
            {0000, 17050}, -- Willow Wand
        }
    },
    [dsp.zone.TAHRONGI_CANYON] =
    {
        regionalItems = {16007}, -- Protect Earring
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4112}, -- Potion
            {0000,  4113}, -- Potion +1
            {0000,  4114}, -- Potion +2
            {0000,  4128}, -- Ether
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4301}, -- Pear au Lait
            {0000,  4425}, -- Tomato Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   626}, -- Black Pepper
            {0000,   641}, -- Tin Ore
            {0000,   688}, -- Arrowwood Log
            {0000,   727}, -- Dogwood Log
            {0000,   750}, -- Silver Beastcoin
            {0000,   768}, -- Flint Stone
            {0000,   846}, -- Insect Wing
            {0000,   893}, -- Giant Femur
            {0000,   912}, -- Beehive Chip
            {0000,   925}, -- Giant Stinger
            {0000,   953}, -- Treant Bulb
            {0000,  1215}, -- Bone Arrowhd.
            {0000,  1845}, -- Red Moko Grass
            {0000,  4112}, -- Potion
            {0000,  4113}, -- Potion +1
            {0000,  4128}, -- Ether
            {0000,  4128}, -- Ether
            {0000,  4148}, -- Antidote
            {0000,  4151}, -- Echo Drops
            {0000,  4227}, -- B. Bolt Quiver
            {0000,  4509}, -- Distilled Water
            {0000, 12432}, -- Faceguard
            {0000, 12449}, -- Brass Cap
            {0000, 12473}, -- Poet's Circlet
            {0000, 12601}, -- Linen Robe
            {0000, 12688}, -- Scale Fng. Gnt.
            {0000, 12705}, -- Brass Mittens
            {0000, 12710}, -- Bone Mittens
            {0000, 12720}, -- Gloves
            {0000, 12729}, -- Linen Cuffs
            {0000, 12816}, -- Scale Cuisses
            {0000, 12834}, -- Bone Subligar
            {0000, 12848}, -- Brais
            {0000, 12857}, -- Linen Slops
            {0000, 12966}, -- Bone Leggings
            {0000, 12976}, -- Gaiters
            {0000, 12985}, -- Holly Clogs
            {0000, 16466}, -- Knife
            {0000, 16531}, -- Brass Xiphos
            {0000, 17096}, -- Holly Pole
            {0000, 17316}, -- Bomb Arm
        }
    },
    [dsp.zone.BUBURIMU_PENINSULA] =
    {
        regionalItems = {18599}, -- Pestle
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4112}, -- Potion
            {0000,  4113}, -- Potion +1
            {0000,  4114}, -- Potion +2
            {0000,  4128}, -- Ether
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4301}, -- Pear au Lait
            {0000,  4425}, -- Tomato Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   642}, -- Zinc Ore
            {0000,   689}, -- Lauan Log
            {0000,   693}, -- Walnut Log
            {0000,   736}, -- Silver Ore
            {0000,   835}, -- Flax Flower
            {0000,   847}, -- Bird Feather
            {0000,   898}, -- Chicken Bone
            {0000,   914}, -- Mercury
            {0000,   936}, -- Rock Salt
            {0000,   947}, -- Firesand
            {0000,  1108}, -- Sulfur
            {0000,  1211}, -- Brz. Bolt Heads
            {0000,  4113}, -- Potion +1
            {0000,  4128}, -- Ether
            {0000,  4148}, -- Antidote
            {0000,  4151}, -- Echo Drops
            {0000,  4373}, -- Woozyshroom
            {0000, 12441}, -- Lizard Helm
            {0000, 12454}, -- Bone Mask
            {0000, 12455}, -- Beetle Mask
            {0000, 12473}, -- Poet's Circlet
            {0000, 12697}, -- Lizard Gloves
            {0000, 12710}, -- Bone Mittens
            {0000, 12711}, -- Beetle Mittens
            {0000, 12729}, -- Linen Cuffs
            {0000, 12737}, -- White Mitts
            {0000, 12825}, -- Lizard Trousers
            {0000, 12834}, -- Bone Subligar
            {0000, 12835}, -- Beetle Subligar
            {0000, 12857}, -- Linen Slops
            {0000, 12865}, -- Black Slacks
            {0000, 12953}, -- Lizard Ledelsens
            {0000, 12966}, -- Bone Leggings
            {0000, 12967}, -- Beetle Leggings
            {0000, 12985}, -- Holly Clogs
            {0000, 12993}, -- Sandals
            {0000, 13584}, -- Cotton Cape
            {0000, 13588}, -- Dhalmel Mantle
            {0000, 16473}, -- Kukri
            {0000, 16643}, -- Battleaxe
        }
    },
    [dsp.zone.MERIPHATAUD_MOUNTAINS] =
    {
        regionalItems = {18503}, -- Mammut
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4116}, -- Hi-Potion
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4131}, -- Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   627}, -- Maple Sugar
            {0000,   637}, -- Slime Oil
            {0000,   643}, -- Iron Ore
            {0000,   690}, -- Elm Log
            {0000,   835}, -- Flax Flower
            {0000,   900}, -- Fish Bones
            {0000,   913}, -- Beeswax
            {0000,   943}, -- Poison Dust
            {0000,  1211}, -- Brz. Bolt Heads
            {0000,  4114}, -- Potion +2
            {0000,  4128}, -- Ether
            {0000,  4129}, -- Ether +1
            {0000,  4151}, -- Echo Drops
            {0000,  4447}, -- Scream Fungus
            {0000, 12441}, -- Lizard Helm
            {0000, 12455}, -- Beetle Mask
            {0000, 12552}, -- Chainmail
            {0000, 12680}, -- Chain Mittens
            {0000, 12711}, -- Beetle Mittens
            {0000, 12737}, -- White Mitts
            {0000, 12825}, -- Lizard Trousers
            {0000, 12865}, -- Black Slacks
            {0000, 12953}, -- Lizard Ledelsens
            {0000, 12967}, -- Beetle Leggings
            {0000, 12993}, -- Sandals
            {0000, 17090}, -- Elm Staff
        }
    },
    [dsp.zone.SAUROMUGUE_CHAMPAIGN] =
    {
        regionalItems = {16368}, -- Herder's Subligar
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4116}, -- Hi-Potion
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4131}, -- Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   573}, -- Vegetable Seeds
            {0000,   636}, -- Chamomile
            {0000,   643}, -- Iron Ore
            {0000,   644}, -- Mythril Ore
            {0000,   691}, -- Maple Log
            {0000,   694}, -- Chestnut Log
            {0000,   749}, -- Mtl. Beastcoin
            {0000,   820}, -- Wool Thread
            {0000,   859}, -- Ram Skin
            {0000,   895}, -- Ram Horn
            {0000,   920}, -- Malboro Vine
            {0000,   928}, -- Bomb Ash
            {0000,   943}, -- Poison Dust
            {0000,  1212}, -- Mtl. Bolt Heads
            {0000,  4113}, -- Potion +1
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000, 12433}, -- Brass Mask
            {0000, 12442}, -- Studded Bandana
            {0000, 12465}, -- Cotton Headgear
            {0000, 12474}, -- Wool Hat
            {0000, 12689}, -- Brass Fng. Gnt.
            {0000, 12721}, -- Cotton Gloves
            {0000, 12817}, -- Brass Cuisses
            {0000, 12849}, -- Cotton Brais
            {0000, 12945}, -- Brass Greaves
            {0000, 12954}, -- Studded Boots
            {0000, 12977}, -- Cotton Gaiters
            {0000, 12986}, -- Chestnut Sabots
            {0000, 13085}, -- Hemp Gorget
            {0000, 13205}, -- Silver Obi
            {0000, 13328}, -- Mythril Earring
            {0000, 13446}, -- Mythril Ring
            {0000, 16467}, -- Mythril Knife
            {0000, 17284}, -- Chakram
        }
    },
    [dsp.zone.THE_SANCTUARY_OF_ZITAH] =
    {
        regionalItems = {18075}, -- Rossignol
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   575}, -- Grain Seeds
            {0000,   612}, -- Kazham Peppers
            {0000,   644}, -- Mythril Ore
            {0000,   699}, -- Oak Log
            {0000,   819}, -- Linen Thread
            {0000,   845}, -- Black C. Feather
            {0000,   914}, -- Mercury
            {0000,  1217}, -- Slv. Arrowheads
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4131}, -- Ether +3
            {0000, 12475}, -- Velvet Hat
            {0000, 12699}, -- Cuir Gloves
            {0000, 12731}, -- Velvet Cuffs
            {0000, 12827}, -- Cuir Trousers
            {0000, 12836}, -- Iron Subligar
            {0000, 12955}, -- Cuir Highboots
            {0000, 12962}, -- Leggings
            {0000, 12987}, -- Ebony Sabots
        }
    },
    [dsp.zone.ROMAEVE] =
    {
        regionalItems = {11486}, -- Diana Corona
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4137}, -- Super Ether +1
            {0000,  4144}, -- Hi-Elixir
            {0000,  4145}, -- Elixir
            {0000,  4149}, -- Panacea
            {0000,  4155}, -- Remedy
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4210}, -- Lethe Water
            {0000,  4255}, -- Mana Powder
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
            {0000,  5322}, -- Healing Powder
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   645}, -- Darksteel Ore
            {0000,   702}, -- Ebony Log
            {0000,   737}, -- Gold Ore
            {0000,   823}, -- Gold Thread
            {0000,   844}, -- Phoenix Feather
            {0000,  1443}, -- Dried Mugwort
            {0000,  4116}, -- Hi-Potion
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4141}, -- Pro-Ether +1
            {0000,  5164}, -- Ground Wasabi
            {0000, 12427}, -- Bascinet
            {0000, 12683}, -- Darksteel Mufflers
            {0000, 12740}, -- Silk Mitts
            {0000, 12811}, -- Dst. Breeches
            {0000, 12829}, -- Beak Trousers
            {0000, 12868}, -- Silk Slacks
            {0000, 12939}, -- Dst. Sollerets
            {0000, 12996}, -- Silk Pumps
            {0000, 13698}, -- Beak Helm
            {0000, 13700}, -- Beak Gloves
            {0000, 13702}, -- Beak Ledelsens
        }
    },
    [dsp.zone.YUHTUNGA_JUNGLE] =
    {
        regionalItems = {17760}, -- Buc. Scimitar
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4116}, -- Hi-Potion
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4131}, -- Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   574}, -- Fruit Seeds
            {0000,   633}, -- Olive Oil
            {0000,   651}, -- Iron Ingot
            {0000,   653}, -- Mythril Ingot
            {0000,   691}, -- Maple Log
            {0000,   822}, -- Silver Thread
            {0000,   943}, -- Poison Dust
            {0000,  1212}, -- Mtl. Bolt Heads
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000, 12458}, -- Soil Hachimaki
            {0000, 12698}, -- Studded Gloves
            {0000, 12714}, -- Soil Tekko
            {0000, 12730}, -- Wool Cuffs
            {0000, 12826}, -- Studded Trousers
            {0000, 12842}, -- Soil Sitabaki
            {0000, 12858}, -- Wool Slops
            {0000, 12954}, -- Studded Boots
            {0000, 12970}, -- Soil Kyahan
            {0000, 12986}, -- Chestnut Sabots
        }
    },
    [dsp.zone.YHOATOR_JUNGLE] =
    {
        regionalItems = {18953}, -- Beluga
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   575}, -- Grain Seeds
            {0000,   612}, -- Kazham Peppers
            {0000,   644}, -- Mythril Ore
            {0000,   699}, -- Oak Log
            {0000,   819}, -- Linen Thread
            {0000,   845}, -- Black C. Feather
            {0000,   914}, -- Mercury
            {0000,  1217}, -- Slv. Arrowheads
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000, 12443}, -- Cuir Bandana
            {0000, 12450}, -- Padded Cap
            {0000, 12458}, -- Soil Hachimaki
            {0000, 12475}, -- Velvet Hat
            {0000, 12571}, -- Cuir Bouilli
            {0000, 12603}, -- Velvet Robe
            {0000, 12699}, -- Cuir Gloves
            {0000, 12706}, -- Iron Mittens
            {0000, 12731}, -- Velvet Cuffs
            {0000, 12827}, -- Cuir Trousers
            {0000, 12836}, -- Iron Subligar
            {0000, 12859}, -- Velvet Slops
            {0000, 12955}, -- Cuir Highboots
            {0000, 12962}, -- Leggings
            {0000, 12987}, -- Ebony Sabots
        }
    },
    [dsp.zone.WESTERN_ALTEPA_DESERT] =
    {
        regionalItems = {19114}, -- Galkan Dagger
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   575}, -- Grain Seeds
            {0000,   612}, -- Kazham Peppers
            {0000,   698}, -- Ash Log
            {0000,   816}, -- Silk Thread
            {0000,   923}, -- Dryad Root
            {0000,   932}, -- Carbon Fiber
            {0000,  1225}, -- Gold Nugget
            {0000,  1228}, -- Dst. Nugget
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000, 12837}, -- Carapace Subligar
            {0000, 13711}, -- Carapace Mask
            {0000, 13713}, -- Carapace Mittens
            {0000, 13715}, -- Cpc. Leggings
            {0000, 16412}, -- Mythril Claws
            {0000, 16558}, -- Falchion
            {0000, 16590}, -- Greatsword
            {0000, 16796}, -- Mythril Zaghnal
            {0000, 17062}, -- Bone Rod
            {0000, 17267}, -- Negoroshiki
            {0000, 17610}, -- Bone Knife
            {0000, 18207}, -- Kheten
        }
    },
    [dsp.zone.QUFIM_ISLAND] =
    {
        regionalItems = {18762}, -- Custodes
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   573}, -- Vegetable Seeds
            {0000,   636}, -- Chamomile
            {0000,   643}, -- Iron Ore
            {0000,   644}, -- Mythril Ore
            {0000,   691}, -- Maple Log
            {0000,   694}, -- Chestnut Log
            {0000,   749}, -- Mtl. Beastcoin
            {0000,   820}, -- Wool Thread
            {0000,   859}, -- Ram Skin
            {0000,   895}, -- Ram Horn
            {0000,   920}, -- Malboro Vine
            {0000,   928}, -- Bomb Ash
            {0000,   943}, -- Poison Dust
            {0000,  1212}, -- Mtl. Bolt Heads
            {0000,  4113}, -- Potion +1
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000, 12433}, -- Brass Mask
            {0000, 12442}, -- Studded Bandana
            {0000, 12465}, -- Cotton Headgear
            {0000, 12474}, -- Wool Hat
            {0000, 12689}, -- Brass Fng. Gnt.
            {0000, 12721}, -- Cotton Gloves
            {0000, 12817}, -- Brass Cuisses
            {0000, 12849}, -- Cotton Brais
            {0000, 12945}, -- Brass Greaves
            {0000, 12954}, -- Studded Boots
            {0000, 12977}, -- Cotton Gaiters
            {0000, 12986}, -- Chestnut Sabots
            {0000, 13085}, -- Hemp Gorget
            {0000, 13205}, -- Silver Obi
            {0000, 13328}, -- Mythril Earring
            {0000, 13446}, -- Mythril Ring
            {0000, 16467}, -- Mythril Knife
            {0000, 17284}, -- Chakram
        }
    },
    [dsp.zone.BEHEMOTHS_DOMINION] =
    {
        regionalItems = {11402}, -- Gothic Sabatons
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   575}, -- Grain Seeds
            {0000,   612}, -- Kazham Peppers
            {0000,   644}, -- Mythril Ore
            {0000,   699}, -- Oak Log
            {0000,   819}, -- Linen Thread
            {0000,   845}, -- Black C. Feather
            {0000,   914}, -- Mercury
            {0000,  1217}, -- Slv. Arrowheads
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000, 12443}, -- Cuir Bandana
            {0000, 12450}, -- Padded Cap
            {0000, 12458}, -- Soil Hachimaki
            {0000, 12475}, -- Velvet Hat
            {0000, 12571}, -- Cuir Bouilli
            {0000, 12603}, -- Velvet Robe
            {0000, 12699}, -- Cuir Gloves
            {0000, 12706}, -- Iron Mittens
            {0000, 12731}, -- Velvet Cuffs
            {0000, 12827}, -- Cuir Trousers
            {0000, 12836}, -- Iron Subligar
            {0000, 12859}, -- Velvet Slops
            {0000, 12955}, -- Cuir Highboots
            {0000, 12962}, -- Leggings
            {0000, 12987}, -- Ebony Sabatons
        }
    },
    [dsp.zone.VALLEY_OF_SORROWS] =
    {
        regionalItems = {18867}, -- Daedalus Hammer
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4137}, -- Super Ether +1
            {0000,  4144}, -- Hi-Elixir
            {0000,  4145}, -- Elixir
            {0000,  4149}, -- Panacea
            {0000,  4155}, -- Remedy
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4210}, -- Lethe Water
            {0000,  4255}, -- Mana Powder
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
            {0000,  5322}, -- Healing Powder
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   645}, -- Darksteel Ore
            {0000,   702}, -- Ebony Log
            {0000,   737}, -- Gold Ore
            {0000,   823}, -- Gold Thread
            {0000,   844}, -- Phoenix Feather
            {0000,  1443}, -- Dried Mugwort
            {0000,  4116}, -- Hi-Potion
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4141}, -- Pro-Ether +1
            {0000,  5164}, -- Ground Wasabi
            {0000, 12427}, -- Bascinet
            {0000, 12683}, -- Darksteel Mufflers
            {0000, 12740}, -- Silk Mitts
            {0000, 12811}, -- Dst. Breeches
            {0000, 12829}, -- Beak Trousers
            {0000, 12868}, -- Silk Slacks
            {0000, 12939}, -- Dst. Sollerets
            {0000, 12996}, -- Silk Pumps
            {0000, 13698}, -- Beak Helm
            {0000, 13700}, -- Beak Gloves
            {0000, 13702}, -- Beak Ledelsens
        }
    },
    [dsp.zone.RUAUN_GARDENS] =
    {
        regionalItems = {16284}, -- Caract Choker
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4137}, -- Super Ether +1
            {0000,  4144}, -- Hi-Elixir
            {0000,  4145}, -- Elixir
            {0000,  4149}, -- Panacea
            {0000,  4155}, -- Remedy
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4210}, -- Lethe Water
            {0000,  4255}, -- Mana Powder
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
            {0000,  5322}, -- Healing Powder
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   646}, -- Adaman Ore
            {0000,   739}, -- Orichalcum Ore
            {0000,   821}, -- Rainbow Thread
            {0000,  1222}, -- Yagudo Fltchg.
            {0000,  1962}, -- Plt. Arrowheads
            {0000,  2459}, -- Minium
            {0000,  2532}, -- Teak Log
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4123}, -- X-Potion +3
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4143}, -- Pro-Ether +3
            {0000,  5662}, -- Dragon Fruit
            {0000, 12309}, -- Ritter Shield
            {0000, 12324}, -- Tower Shield
            {0000, 13087}, -- Jeweled Collar
            {0000, 13185}, -- Muscle Belt
            {0000, 13212}, -- Tarutaru Sash
            {0000, 13587}, -- Rainbow Cape
            {0000, 13595}, -- Coeurl Mantle
            {0000, 15890}, -- Marid Belt
            {0000, 16128}, -- Wivre Hairpin
            {0000, 16265}, -- Wivre Gorget
        }
    },
    [dsp.zone.THE_BOYAHDA_TREE] =
    {
        regionalItems = {11038, 10948}, -- Carver's Torque | Dragonkin Earring
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   657}, -- Tama-Hagane
            {0000,   876}, -- Manta Skin
            {0000,   887}, -- Coral Fragment
            {0000,   919}, -- Boyahda Moss
            {0000,  1163}, -- Manticore Hair
            {0000,  1446}, -- Lacquer Tree Log
            {0000,  3313}, -- Vivi-Valve
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4122}, -- X-Potion +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4155}, -- Remedy
            {0000,  4173}, -- Hi-Reraiser
            {0000,  4174}, -- Vile Elixir
            {0000,  4291}, -- Sandfish
            {0000,  4447}, -- Scream Fungus
            {0000,  5866}, -- Toolbag (Moku)
            {0000,  5871}, -- Ruszor Quiver
            {0000, 17881}, -- Deepbed Soil
            {0000, 17884}, -- Sun Water
            {0000, 17898}, -- C. Grass. Broth
            {0000, 17899}, -- Svg. Mole Broth
        }
    },
    [dsp.zone.MIDDLE_DELKFUTTS_TOWER] =
    {
        regionalItems = {651}, -- Iron Ingot
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4116}, -- Hi-Potion
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4131}, -- Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   574}, -- Fruit Seeds
            {0000,   651}, -- Iron Ingot
            {0000,   691}, -- Maple Log
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  4114}, -- Potion +2
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
        }
    },
    [dsp.zone.UPPER_DELKFUTTS_TOWER] =
    {
        regionalItems = {19779}, -- Potestas Bomblet
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4116}, -- Hi-Potion
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4131}, -- Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   702}, -- Ebony Log
            {0000,   844}, -- Phoenix Feather
            {0000,  3308}, -- Power Cooler
            {0000,  3434}, -- Cobalt Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4141}, -- Pro-Ether +1
            {0000, 12996}, -- Silk Pumps
        }
    },
    [dsp.zone.TEMPLE_OF_UGGALEPIH] =
    {
        regionalItems = {10953}, -- Boneworker's Torque
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   645}, -- Darksteel Ore
            {0000,   702}, -- Ebony Log
            {0000,   737}, -- Gold Ore
            {0000,   823}, -- Gold Thread
            {0000,   844}, -- Phoenix Feather
            {0000,  1122}, -- Wyvern Skin
            {0000,  1213}, -- Dst. Bolt Heads
            {0000,  3308}, -- Power Cooler
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3450}, -- Voiddust
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4121}, -- X-Potion +1
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4141}, -- Pro-Ether +1
            {0000,  4449}, -- Reishi Mushroom
            {0000,  5164}, -- Ground Wasabi
            {0000, 12427}, -- Bascinet
            {0000, 12811}, -- Dst. Breeches
            {0000, 12939}, -- Dst. Sollerets
            {0000, 12996}, -- Silk Pumps
        }
    },
    [dsp.zone.DEN_OF_RANCOR] =
    {
        regionalItems = {10950, 10991}, -- Goldsm. Torque | Rancorous Mantle
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4137}, -- Super Ether +1
            {0000,  4144}, -- Hi-Elixir
            {0000,  4145}, -- Elixir
            {0000,  4149}, -- Panacea
            {0000,  4155}, -- Remedy
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4210}, -- Lethe Water
            {0000,  4255}, -- Mana Powder
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
            {0000,  5322}, -- Healing Powder
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   646}, -- Adaman Ore
            {0000,   739}, -- Orichalcum Ore
            {0000,   821}, -- Rainbow Thread
            {0000,  1122}, -- Wyvern Skin
            {0000,  1222}, -- Yagudo Fltchg.
            {0000,  1962}, -- Plt. Arrowheads
            {0000,  2459}, -- Minium
            {0000,  2532}, -- Teak Log
            {0000,  3312}, -- Percolator
            {0000,  3314}, -- Disruptor
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4123}, -- X-Potion +3
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4143}, -- Pro-Ether +3
            {0000,  5662}, -- Dragon Fruit
            {0000,  8555}, -- Barrier Module
            {0000, 12309}, -- Ritter Shield
            {0000, 12324}, -- Tower Shield
            {0000, 13087}, -- Jeweled Collar
            {0000, 13185}, -- Muscle Belt
            {0000, 13212}, -- Tarutaru Sash
            {0000, 13587}, -- Rainbow Cape
            {0000, 13595}, -- Coeurl Mantle
            {0000, 15890}, -- Marid Belt
            {0000, 16128}, -- Wivre Hairpin
        }
    },
    [dsp.zone.RANGUEMONT_PASS] =
    {
        regionalItems = {11575}, -- Grapevine Cape
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4112}, -- Potion
            {0000,  4113}, -- Potion +1
            {0000,  4114}, -- Potion +2
            {0000,  4128}, -- Ether
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4301}, -- Pear au Lait
            {0000,  4425}, -- Tomato Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   657}, -- Tama-Hagane
            {0000,   876}, -- Manta Skin
            {0000,   887}, -- Coral Fragment
            {0000,   919}, -- Boyahda Moss
            {0000,  1163}, -- Manticore Hair
            {0000,  1446}, -- Lacquer Tree Log
            {0000,  3313}, -- Vivi-Valve
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4122}, -- X-Potion +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4155}, -- Remedy
            {0000,  4173}, -- Hi-Reraiser
            {0000,  4174}, -- Vile Elixir
            {0000,  4291}, -- Sandfish
            {0000,  4447}, -- Scream Fungus
            {0000,  5866}, -- Toolbag (Moku)
            {0000,  5871}, -- Ruszor Quiver
            {0000, 17881}, -- Deepbed Soil
            {0000, 17884}, -- Sun Water
            {0000, 17898}, -- C. Grass. Broth
            {0000, 17899}, -- Svg. Mole Broth
        }
    },
    [dsp.zone.BOSTAUNIEUX_OUBLIETTE] =
    {
        regionalItems = {11920}, -- Melaco Mittens
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   737}, -- Gold Ore
            {0000,   739}, -- Orichalcum Ore
            {0000,   748}, -- Gold Beastcoin
            {0000,   769}, -- Red Rock
            {0000,   821}, -- Rainbow Thread
            {0000,   844}, -- Phoenix Feather
            {0000,  1213}, -- Dst. Bolt Heads
            {0000,  2459}, -- Minium
            {0000,  3309}, -- Barrage Turbine
            {0000,  3313}, -- Vivi-Valve
            {0000,  3314}, -- Disruptor
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4144}, -- Hi-Elixir
            {0000,  4155}, -- Remedy
            {0000,  4173}, -- Hi-Reraiser
            {0000,  5662}, -- Dragon Fruit
            {0000,  5821}, -- Fsn. Bolt Quiver
            {0000, 13929}, -- Errant Hat
            {0000, 14078}, -- Errant Cuffs
            {0000, 14380}, -- Errant Hpl.
            {0000, 16520}, -- Verdun
        }
    },
    [dsp.zone.TORAIMARAI_CANAL] =
    {
        regionalItems = {11576}, -- Bond Cape
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   844}, -- Phoenix Feather
            {0000,  1443}, -- Dried Mugwort
            {0000,  3434}, -- Cobalt Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4144}, -- Hi-Elixir
            {0000,  4173}, -- Hi-Reraiser
            {0000,  5164}, -- Ground Wasabi
            {0000, 13929}, -- Errant Hat
        }
    },
    [dsp.zone.ZERUHN_MINES] =
    {
        regionalItems = {11677}, -- Prouesse Ring
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   505}, -- Sheepskin
            {0000,   626}, -- Black Pepper
            {0000,   656}, -- Beastcoin
            {0000,   679}, -- Aluminum Ingot
            {0000,   714}, -- Holly Lumber
            {0000,   727}, -- Dogwood Log
            {0000,   750}, -- Silver Beastcoin
            {0000,   818}, -- Cotton Thread
            {0000,   852}, -- Lizard Skin
            {0000,   880}, -- Bone Chip
            {0000,   893}, -- Giant Femur
            {0000,   912}, -- Beehive Chip
            {0000,   925}, -- Giant Stinger
            {0000,  1225}, -- Gold Nugget
            {0000,  1845}, -- Red Moko Grass
            {0000,  1981}, -- Skull Locust
            {0000,  3307}, -- Heat Capacitor
            {0000,  3308}, -- Power Cooler
            {0000,  3309}, -- Barrage Turbine
            {0000,  3311}, -- Galvanizer
            {0000,  3312}, -- Percolator
            {0000,  3313}, -- Vivi-Valve
            {0000,  3314}, -- Disruptor
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4121}, -- X-Potion +1
            {0000,  4123}, -- X-Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4141}, -- Pro-Ether +1
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4145}, -- Elixir
            {0000,  4370}, -- Honey
            {0000,  5819}, -- Antlion Quiver
            {0000,  8555}, -- Barrier Module
            {0000, 12469}, -- War Beret
            {0000, 12725}, -- War Gloves
            {0000, 12853}, -- War Brais
            {0000, 12981}, -- War Boots
            {0000, 13212}, -- Tarutaru Sash
            {0000, 13467}, -- Dragon Ring
            {0000, 17316}, -- Bomb Arm
            {0000, 17894}, -- Vermihumus
        },
    },
    [dsp.zone.KORROLOKA_TUNNEL] =
    {
        regionalItems = {11039}, -- Brachyura Earring
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   746}, -- Platinum Ingot
            {0000,   835}, -- Flax Flower
            {0000,   898}, -- Chicken Bone
            {0000,  1155}, -- Iron Sand
            {0000,  3437}, -- Jade Cell
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4121}, -- X-Potion +1
            {0000,  4123}, -- X-Potion +3
            {0000,  4141}, -- Pro-Ether +1
            {0000,  4145}, -- Elixir
            {0000,  4155}, -- Remedy
            {0000,  4449}, -- Reishi Mushroom
            {0000, 12880}, -- Ogre Trousers
            {0000, 13704}, -- Ogre Mask
        }
    },
    [dsp.zone.KUFTAL_TUNNEL] =
    {
        regionalItems = {18816}, -- Wizzan Grip
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   657}, -- Tama-Hagane
            {0000,   685}, -- Khroma Ore
            {0000,   876}, -- Manta Skin
            {0000,   919}, -- Boyahda Moss
            {0000,  1446}, -- Lacquer Tree Log
            {0000,  3307}, -- Heat Capacitor
            {0000,  3308}, -- Power Cooler
            {0000,  3309}, -- Barrage Turbine
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4123}, -- X-Potion +3
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4155}, -- Remedy
            {0000,  4173}, -- Hi-Reraiser
            {0000,  4174}, -- Vile Elixir
            {0000,  4175}, -- Vile Elixir +1
            {0000,  4291}, -- Sandfish
            {0000,  4447}, -- Scream Fungus
            {0000,  5866}, -- Toolbag (Moku)
            {0000,  5872}, -- D.A. Bolt Quiver
        }
    },
    [dsp.zone.SEA_SERPENT_GROTTO] =
    {
        regionalItems = {19780}, -- Mana Ampulla
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   645}, -- Darksteel Ore
            {0000,   702}, -- Ebony Log
            {0000,   737}, -- Gold Ore
            {0000,   823}, -- Gold Thread
            {0000,   843}, -- G. Bird Plume
            {0000,   844}, -- Phoenix Feather
            {0000,  1155}, -- Iron Sand
            {0000,  1213}, -- Dst. Bolt Heads
            {0000,  1443}, -- Dried Mugwort
            {0000,  3314}, -- Disruptor
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4141}, -- Pro-Ether +1
            {0000,  4449}, -- Reishi Mushroom
            {0000,  5164}, -- Ground Wasabi
            {0000, 12427}, -- Bascinet
            {0000, 12683}, -- Darksteel Mufflers
            {0000, 12811}, -- Dst. Breeches
            {0000, 12868}, -- Silk Slacks
            {0000, 12996}, -- Silk Pumps
            {0000, 13702}, -- Beak Ledelsens
        }
    },
    [dsp.zone.VELUGANNON_PALACE] =
    {
        regionalItems = {13467}, -- Dragon Ring
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4121}, -- X-Potion +1
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4137}, -- Super Ether +1
            {0000,  4144}, -- Hi-Elixir
            {0000,  4145}, -- Elixir
            {0000,  4149}, -- Panacea
            {0000,  4155}, -- Remedy
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4210}, -- Lethe Water
            {0000,  4255}, -- Mana Powder
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
            {0000,  5322}, -- Healing Powder
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   679}, -- Aluminum Ingot
            {0000,   698}, -- Ash Log
            {0000,   714}, -- Holly Lumber
            {0000,   880}, -- Bone Chip
            {0000,   912}, -- Beehive Chip
            {0000,  1225}, -- Gold Nugget
            {0000,  1981}, -- Skull Locust
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4141}, -- Pro-Ether +1
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4145}, -- Elixir
            {0000,  4449}, -- Reishi Mushroom
            {0000, 12469}, -- War Beret
            {0000, 12853}, -- War Brais
            {0000, 12981}, -- War Boots
            {0000, 17894}, -- Vermihumus
        }
    },
    [dsp.zone.THE_SHRINE_OF_RUAVITAU] =
    {
        regionalItems = {11040, 10951}, -- Weaver's Torque | Terminus Earring
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   657}, -- Tama-Hagane
            {0000,   876}, -- Manta Skin
            {0000,   887}, -- Coral Fragment
            {0000,   919}, -- Boyahda Moss
            {0000,  1163}, -- Manticore Hair
            {0000,  1446}, -- Lacquer Tree Log
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3450}, -- Voiddust
            {0000,  4123}, -- X-Potion +3
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4155}, -- Remedy
            {0000,  4173}, -- Hi-Reraiser
            {0000,  4174}, -- Vile Elixir
            {0000,  4291}, -- Sandfish
            {0000,  4447}, -- Scream Fungus
            {0000,  5823}, -- Obr. Bull. Pouch
            {0000,  5866}, -- Toolbag (Moku)
            {0000,  5871}, -- Ruszor Quiver
            {0000,  5872}, -- D.A. Bolt Quiver
            {0000, 17881}, -- Deepbed Soil
        }
    },
    [dsp.zone.LOWER_DELKFUTTS_TOWER] =
    {
        regionalItems = {11043}, -- Giant's Earring
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4120}, -- X-Potion
            {0000,  4134}, -- Hi-Ether +2
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4136}, -- Super Ether
            {0000,  4145}, -- Elixir
            {0000,  4148}, -- Antidote
            {0000,  4150}, -- Eye Drops
            {0000,  4151}, -- Echo Drops
            {0000,  4155}, -- Remedy
            {0000,  4164}, -- Prism Powder
            {0000,  4165}, -- Silent Oil
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4302}, -- Pamama au Lait
            {0000,  4424}, -- Melon Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   574}, -- Fruit Seeds
            {0000,   653}, -- Mythril Ingot
            {0000,   928}, -- Bomb Ash
            {0000,   943}, -- Poison Dust
            {0000,  1981}, -- Skull Locust
            {0000,  3434}, -- Cobalt Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  4113}, -- Potion +1
            {0000,  4114}, -- Potion +2
            {0000,  4115}, -- Potion +3
            {0000,  4115}, -- Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4130}, -- Ether +2
            {0000,  4131}, -- Ether +3
            {0000,  4148}, -- Antidote
            {0000,  4155}, -- Remedy
            {0000,  8555}, -- Barrier Module
        }
    },
    [dsp.zone.KING_RANPERRES_TOMB] =
    {
        regionalItems = {10924}, -- Chocobo Torque
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   626}, -- Black Pepper
            {0000,   642}, -- Zinc Ore
            {0000,   679}, -- Aluminum Ingot
            {0000,   698}, -- Ash Log
            {0000,   727}, -- Dogwood Log
            {0000,   750}, -- Silver Beastcoin
            {0000,   880}, -- Bone Chip
            {0000,  1225}, -- Gold Nugget
            {0000,  1981}, -- Skull Locust
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  4114}, -- Potion +2
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4121}, -- X-Potion +1
            {0000,  4123}, -- X-Potion +3
            {0000,  4129}, -- Ether +1
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4141}, -- Pro-Ether +1
            {0000,  4145}, -- Elixir
            {0000, 12853}, -- War Brais
            {0000, 12981}, -- War Boots
            {0000, 17316}, -- Bomb Arm
        }
    },
    [dsp.zone.DANGRUF_WADI] =
    {
        regionalItems = {11769}, -- Field Rope
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   646}, -- Adaman Ore
            {0000,   653}, -- Mythril Ingot
            {0000,   690}, -- Elm Log
            {0000,   694}, -- Chestnut Log
            {0000,   749}, -- Mtl. Beastcoin
            {0000,   940}, -- Revival Root
            {0000,   943}, -- Poison Dust
            {0000,  3311}, -- Galvanizer
            {0000,  3436}, -- Xanthous Cell
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4144}, -- Hi-Elixir
            {0000,  4155}, -- Remedy
            {0000, 11769}, -- Field Rope
            {0000, 12437}, -- Gavial Mask
        }
    },
    [dsp.zone.INNER_HORUTOTO_RUINS] =
    {
        regionalItems = {18624}, -- Numen Staff
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   505}, -- Sheepskin
            {0000,   714}, -- Holly Lumber
            {0000,   818}, -- Cotton Thread
            {0000,  1225}, -- Gold Nugget
            {0000,  1981}, -- Skull Locust
            {0000,  3307}, -- Heat Capacitor
            {0000,  3436}, -- Xanthous Cell
            {0000,  4114}, -- Potion +2
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4123}, -- X-Potion +3
            {0000,  4130}, -- Ether +2
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4141}, -- Pro-Ether +1
            {0000,  4145}, -- Elixir
            {0000,  8555}, -- Barrier Module
            {0000, 12469}, -- War Beret
            {0000, 12725}, -- War Gloves
        }
    },
    [dsp.zone.ORDELLES_CAVES] =
    {
        regionalItems = {11767}, -- Chocobo Rope
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   702}, -- Ebony Log
            {0000,   746}, -- Platinum Ingot
            {0000,   857}, -- Dhalmel Hide
            {0000,   898}, -- Chicken Bone
            {0000,   913}, -- Beeswax
            {0000,  1229}, -- Adaman Nugget
            {0000,  3311}, -- Galvanizer
            {0000,  3313}, -- Vivi-Valve
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4112}, -- Potion
            {0000,  4113}, -- Potion +1
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4145}, -- Elixir
            {0000,  4155}, -- Remedy
            {0000,  5416}, -- Stl. Bull. Pouch
            {0000, 12880}, -- Ogre Trousers
            {0000, 13587}, -- Rainbow Cape
            {0000, 13704}, -- Ogre Mask
            {0000, 13706}, -- Ogre Gloves
            {0000, 13708}, -- Ogre Ledelsens
        }
    },
    [dsp.zone.OUTER_HORUTOTO_RUINS] =
    {
        regionalItems = {10925}, -- Fisher's Torque
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   505}, -- Sheepskin
            {0000,   626}, -- Black Pepper
            {0000,   642}, -- Zinc Ore
            {0000,   679}, -- Aluminum Ingot
            {0000,   714}, -- Holly Lumber
            {0000,   728}, -- Dogwd. Lumber
            {0000,   818}, -- Cotton Thread
            {0000,   852}, -- Lizard Skin
            {0000,   912}, -- Beehive Chip
            {0000,  1225}, -- Gold Nugget
            {0000,  1981}, -- Skull Locust
            {0000,  3308}, -- Power Cooler
            {0000,  3311}, -- Galvanizer
            {0000,  3313}, -- Vivi-Valve
            {0000,  3314}, -- Disruptor
            {0000,  3434}, -- Cobalt Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4145}, -- Elixir
            {0000, 12469}, -- War Beret
            {0000, 12725}, -- War Gloves
            {0000, 12853}, -- War Brais
            {0000, 12981}, -- War Boots
            {0000, 13212}, -- Tarutaru Sash
            {0000, 13467}, -- Dragon Ring
            {0000, 17894}, -- Vermihumus
        }
    },
    [dsp.zone.THE_ELDIEME_NECROPOLIS] =
    {
        regionalItems = {18812}, -- Ossa Grip
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   574}, -- Fruit Seeds
            {0000,   633}, -- Olive Oil
            {0000,   646}, -- Adaman Ore
            {0000,   694}, -- Chestnut Log
            {0000,   749}, -- Mtl. Beastcoin
            {0000,   859}, -- Ram Skin
            {0000,   895}, -- Ram Horn
            {0000,   943}, -- Poison Dust
            {0000,  3309}, -- Barrage Turbine
            {0000,  3434}, -- Cobalt Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4121}, -- X-Potion +1
            {0000,  4123}, -- X-Potion +3
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4144}, -- Hi-Elixir
            {0000, 12437}, -- Gavial Mask
            {0000, 12693}, -- Gavial Fng. Gnt.
            {0000, 16396}, -- Koenigs Knuckles
            {0000, 17364}, -- Cythara Anglica
            {0000, 17898}, -- C. Grass. Broth
            {0000, 18259}, -- Angon
        }
    },
    [dsp.zone.GUSGEN_MINES] =
    {
        regionalItems = {10926}, -- Field Torque
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   690}, -- Elm Log
            {0000,   746}, -- Platinum Ingot
            {0000,   834}, -- Saruta Cotton
            {0000,   898}, -- Chicken Bone
            {0000,  1229}, -- Adaman Nugget
            {0000,  3434}, -- Cobalt Cell
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4123}, -- X-Potion +3
            {0000,  4145}, -- Elixir
            {0000, 12821}, -- Gavial Cuisses
            {0000, 13708}, -- Ogre Ledelsens
        }
    },
    [dsp.zone.CRAWLERS_NEST] =
    {
        regionalItems = {11823}, -- Cocoon Band
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   633}, -- Olive Oil
            {0000,   646}, -- Adaman Ore
            {0000,   690}, -- Elm Log
            {0000,   750}, -- Silver Beastcoin
            {0000,   820}, -- Wool Thread
            {0000,   895}, -- Ram Horn
            {0000,   943}, -- Poison Dust
            {0000,  3436}, -- Xanthous Cell
            {0000,  3450}, -- Voiddust
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4118}, -- Hi-Potion +2
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4121}, -- X-Potion +1
            {0000,  4123}, -- X-Potion +3
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4141}, -- Pro-Ether +1
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4144}, -- Hi-Elixir
            {0000,  4155}, -- Remedy
            {0000, 12693}, -- Gavial Fng. Gnt.
            {0000, 12949}, -- Gavial Greaves
            {0000, 16396}, -- Koenigs Knuckles
            {0000, 18259}, -- Angon
        }
    },
    [dsp.zone.MAZE_OF_SHAKHRAMI] =
    {
        regionalItems = {11768}, -- Fisher's Rope
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   637}, -- Slime Oil
            {0000,   643}, -- Iron Ore
            {0000,   693}, -- Walnut Log
            {0000,   702}, -- Ebony Log
            {0000,   746}, -- Platinum Ingot
            {0000,   834}, -- Saruta Cotton
            {0000,   857}, -- Dhalmel Hide
            {0000,  1229}, -- Adaman Nugget
            {0000,  3307}, -- Heat Capacitor
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3450}, -- Voiddust
            {0000,  4121}, -- X-Potion +1
            {0000,  4123}, -- X-Potion +3
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4141}, -- Pro-Ether +1
            {0000,  4145}, -- Elixir
            {0000,  4155}, -- Remedy
            {0000,  4373}, -- Woozyshroom
            {0000,  5416}, -- Stl. Bull. Pouch
            {0000, 12880}, -- Ogre Trousers
            {0000, 13329}, -- Ocl. Earring
            {0000, 13587}, -- Rainbow Cape
            {0000, 13706}, -- Ogre Gloves
            {0000, 13708}, -- Ogre Ledelsens
        }
    },
    [dsp.zone.GARLAIGE_CITADEL] =
    {
        regionalItems = {18784}, -- Metasoma Katars
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   633}, -- Olive Oil
            {0000,   646}, -- Adaman Ore
            {0000,   653}, -- Mythril Ingot
            {0000,   690}, -- Elm Log
            {0000,   691}, -- Maple Log
            {0000,   749}, -- Mtl. Beastcoin
            {0000,   750}, -- Silver Beastcoin
            {0000,   820}, -- Wool Thread
            {0000,   859}, -- Ram Skin
            {0000,   928}, -- Bomb Ash
            {0000,   940}, -- Revival Root
            {0000,   943}, -- Poison Dust
            {0000,  1212}, -- Mtl. Bolt Heads
            {0000,  3312}, -- Percolator
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4117}, -- Hi-Potion +1
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4121}, -- X-Potion +1
            {0000,  4123}, -- X-Potion +3
            {0000,  4133}, -- Hi-Ether +1
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4141}, -- Pro-Ether +1
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4144}, -- Hi-Elixir
            {0000,  4155}, -- Remedy
            {0000, 12437}, -- Gavial Mask
            {0000, 12949}, -- Gavial Greaves
            {0000, 16396}, -- Koenigs Knuckles
            {0000, 17364}, -- Cythara Anglica
            {0000, 18259}, -- Angon
        }
    },
    [dsp.zone.FEIYIN] =
    {
        regionalItems = {16202}, -- Dagda's Shield
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   645}, -- Darksteel Ore
            {0000,   646}, -- Adaman Ore
            {0000,   739}, -- Orichalcum Ore
            {0000,   748}, -- Gold Beastcoin
            {0000,   773}, -- Translucent Rock
            {0000,   775}, -- Black Rock
            {0000,   776}, -- White Rock
            {0000,   821}, -- Rainbow Thread
            {0000,   823}, -- Gold Thread
            {0000,  1222}, -- Yagudo Fltchg.
            {0000,  1962}, -- Plt. Arrowheads
            {0000,  2459}, -- Minium
            {0000,  2761}, -- Feyweald Log
            {0000,  3312}, -- Percolator
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4123}, -- X-Potion +3
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4144}, -- Hi-Elixir
            {0000,  4155}, -- Remedy
            {0000,  4173}, -- Hi-Reraiser
            {0000,  5821}, -- Fsn. Bolt Quiver
            {0000, 13929}, -- Errant Hat
            {0000, 14078}, -- Errant Cuffs
            {0000, 14182}, -- Errant Pigaches
            {0000, 14301}, -- Errant Slops
            {0000, 16520}, -- Verdun
            {0000, 17896}, -- Gob. Bug Broth
            {0000, 18258}, -- Thr. Tomahawk
        }
    },
    [dsp.zone.IFRITS_CAULDRON] =
    {
        regionalItems = {10949}, -- Smithy's Torque
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   646}, -- Adaman Ore
            {0000,   739}, -- Orichalcum Ore
            {0000,   821}, -- Rainbow Thread
            {0000,   838}, -- Spider Web
            {0000,   843}, -- G. Bird Plume
            {0000,  1155}, -- Iron Sand
            {0000,  1222}, -- Yagudo Fltchg.
            {0000,  1962}, -- Plt. Arrowheads
            {0000,  2459}, -- Minium
            {0000,  2532}, -- Teak Log
            {0000,  3309}, -- Barrage Turbine
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3436}, -- Xanthous Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4123}, -- X-Potion +3
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4143}, -- Pro-Ether +3
            {0000,  5662}, -- Dragon Fruit
            {0000,  8555}, -- Barrier Module
            {0000, 12309}, -- Ritter Shield
            {0000, 13212}, -- Tarutaru Sash
            {0000, 13587}, -- Rainbow Cape
            {0000, 13595}, -- Coeurl Mantle
            {0000, 15890}, -- Marid Belt
            {0000, 16128}, -- Wivre Hairpin
            {0000, 16265}, -- Wivre Gorget
        }
    },
    [dsp.zone.GUSTAV_TUNNEL] =
    {
        regionalItems = {10955, 11041}, -- Culinarian's Torque | Liminus Earring
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,   657}, -- Tama-Hagane
            {0000,   876}, -- Manta Skin
            {0000,   887}, -- Coral Fragment
            {0000,  1163}, -- Manticore Hair
            {0000,  1446}, -- Lacquer Tree Log
            {0000,  3307}, -- Heat Capacitor
            {0000,  3312}, -- Percolator
            {0000,  3313}, -- Vivi-Valve
            {0000,  3434}, -- Cobalt Cell
            {0000,  3435}, -- Rubicund Cell
            {0000,  3437}, -- Jade Cell
            {0000,  3450}, -- Voiddust
            {0000,  4119}, -- Hi-Potion +3
            {0000,  4123}, -- X-Potion +3
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4143}, -- Pro-Ether +3
            {0000,  4155}, -- Remedy
            {0000,  4173}, -- Hi-Reraiser
            {0000,  4174}, -- Vile Elixir
            {0000,  4291}, -- Sandfish
            {0000,  4447}, -- Scream Fungus
            {0000,  5871}, -- Ruszor Quiver
            {0000,  5872}, -- D.A. Bolt Quiver
            {0000, 17881}, -- Deepbed Soil
        }
    },
    [dsp.zone.LABYRINTH_OF_ONZOZO] =
    {
        regionalItems = {18817}, -- Furtive Grip
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  4202}, -- Daedalus Wing
            {0000,  4206}, -- Catholicon
            {0000,  4255}, -- Mana Powder
            {0000,  5322}, -- Healing Powder
            {0000,  5393}, -- Monarch's Drink
            {0000,  5394}, -- Gnostic's Drink
            {0000,  5395}, -- Cleric's Drink
            {0000,  5433}, -- Dusty Elixir
            {0000,  5439}, -- Vicar's Drink
            {0000,  5440}, -- Dusty Wing
            {0000,  5824}, -- Lucid Potion I
            {0000,  5825}, -- Lucid Potion II
            {0000,  5826}, -- Lucid Potion III
            {0000,  5832}, -- Healing Mist
            {0000,  5833}, -- Mana Mist
            {0000,  5834}, -- Lucid Wings I
            {0000,  5835}, -- Healing Salve I
            {0000,  5836}, -- Healing Salve II
            {0000,  5837}, -- Clear Salve I
            {0000,  5838}, -- Clear Salve II
            {0000,  5839}, -- Stalwart's Tonic
            {0000,  5840}, -- Stalwart's Gambir
            {0000,  5841}, -- Ascetic's Tonic
            {0000,  5842}, -- Ascetic's Gambir
            {0000,  5845}, -- Fanatic's Tonic
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {0000,  1213}, -- Dst. Bolt Heads
            {0000,  1443}, -- Dried Mugwort
            {0000,  2761}, -- Feyweald Log
            {0000,  3312}, -- Percolator
            {0000,  3450}, -- Voiddust
            {0000,  4123}, -- X-Potion +3
            {0000,  4135}, -- Hi-Ether +3
            {0000,  4144}, -- Hi-Elixir
            {0000,  4155}, -- Remedy
            {0000,  4174}, -- Vile Elixir
            {0000,  4449}, -- Reishi Mushroom
            {0000,  9068}, -- Barrier Module
        }
    },
}



---------------------------------------------------------------------------------------------
-- Casket spawn checks
---------------------------------------------------------------------------------------------
dsp.caskets.SpawnCasket = function (player, mob, x, y, z, r)
    local chestId    = GetCasketID(mob)
    local npc        = GetNPCByID(chestId)
    local chestOwner = player:getLeaderID()

    if chestId == 0 then
        return
    end

    if DropChance(player) == true then
        SetCasketData(player, x, y, z, r, npc, chestOwner)
    end
end

function DropChance(player)
    -----------------------------------------------------------------------------------------
    -- NOTES: 10% base drop rate.
    -- Super Kupowers(Myriad Mystery Boxes) adds 10% drop rate.
    -- GoV Prowess Increased Treasure Casket Discovery adds 2% per level (max 5 levels)
    -- for a total of 10% increase.
    -- Total max amount is 30% drop rate.
    -----------------------------------------------------------------------------------------
    local kupowersMMB         = 0 -- Super Kupowers Myriad Mystery Boxes not implimented yet.
    local kupowersMMBPower    = 0
    local prowessCaskets      = 0
    local prowessCasketsPower = 0
    local baseChance          = 0.1 * CASKET_DROP_RATE
    local dropChance          = 0

    --kupowersMMB = dsp.effect.KUPOWERS_MYRIAD_MYSTERY_BOXES

    --if player:hasStatusEffect(kupowersMMB) then
    --    kupowersMMBPower = 0.1
    --end

    prowessCaskets  = dsp.effect.PROWESS_CASKET_RATE

    if player:hasStatusEffect(prowessCaskets) then
        prowessCasketsPower = player:getStatusEffect(prowessCaskets):getPower()
    end

    dropChance = baseChance + kupowersMMBPower + prowessCasketsPower
    dropChance = utils.clamp(dropChance, 0, 1)

    local rand = math.random()

    if rand < dropChance then
        return true
    end

    return false
end

function GetCasketID(mob)
    local zoneId      = mob:getZoneID()
    local baseChestId = zones[zoneId].npc.CASKET_BASE
    local chestId     = 0
    local spawnStatus = nil

    for i = baseChestId, baseChestId + 15 do
        if TimeElapsedCheck(GetNPCByID(i)) then
            if GetNPCByID(i):getLocalVar("SPAWNSTATUS") == casketInfo.spawnStatus.DESPAWNED or
                GetNPCByID(i):getLocalVar("SPAWNSTATUS") == nil then
                chestId = i
                break
            end
        end
        i = i + 1
    end

    if GetNPCByID(chestId) == nil then
        return 0
    end

    return chestId
end

function TimeElapsedCheck(npc)
    local lastSpawned = 0
    local spawnTime   = os.time() + 360000 -- defualt time in case no var set.
    local timeTable   = {00, 00, 00}       -- HOURS,MINUTES,SECONDS.

    spawnTime   = npc:getLocalVar("SPAWNTIME")
    lastSpawned = os.time() - spawnTime
    timeTable   = ConvertTime(lastSpawned)

    if tonumber(timeTable[1]) >= 01 or tonumber(timeTable[1]) < 01 and tonumber(timeTable[2]) >= 05 then
        return true
    end

    return false
end
----------------------------------------------------------------------
-- Main public casket functions
----------------------------------------------------------------------
dsp.caskets.onTrigger = function(player, npc)
    ------------------------------------------------------------------
    -- Basic chest var's
    ------------------------------------------------------------------
    local chestId           = npc:getID()                             -- ID of the chest
    local itemType          = npc:getLocalVar("LOOT_TYPE")            -- Type: 1 Temps, 2 Items.
    local locked            = npc:getLocalVar("LOCKED")               -- enter two-digit combination (10~99).
    local chestOwner        = npc:getLocalVar("PARTYID")              -- the id of the party that has rights to the chest.
    local leaderId          = player:getLeaderID()
    --local aumentflag      = 0x0202                                  -- Used for Evoliths (not implemented yet).
    local zoneId            = npc:getZoneID()
    local eventBase         = zones[zoneId].npc.CASKET_BASE           -- base id of the current chest.
    local lockedEvent       = casketInfo.cs[chestId - eventBase] + 2  -- Chest locked cs's.
    local unlockedEvent     = casketInfo.cs[chestId - eventBase]      -- Chest unlocked cs's.

    ------------------------------------------------------------------
    -- Locked chest var's
    ------------------------------------------------------------------
    local partySize         = 0
    local attemptsAllowed   = npc:getLocalVar("ATTEMPTS", attempts)
    local failedAtempts     = npc:getLocalVar("FAILED_ATEMPTS")
    local remainingAttempts = attemptsAllowed - failedAtempts

    if leaderId ~= chestOwner then
        return
    end

    GetDrops(npc, itemType, player:getZoneID())

    --------------------------------------------------
    -- Chest Locked
    -------------------------------------------------
    if locked ~= 0 then
        player:startEvent(lockedEvent, remainingAttempts, 0, 0, 0, 0, 0, 0, 0) -- Start the minigame if locked.
    else
    --------------------------------------------------
    -- Chest Unlocked
    -------------------------------------------------
        if npc:getLocalVar("SPAWNSTATUS") == casketInfo.spawnStatus.SPAWNED_CLOSED then      -- is the chest shut?, then open it.
            npc:AnimationSub(1)
            npc:setLocalVar("SPAWNSTATUS", casketInfo.spawnStatus.SPAWNED_OPEN)
        end

        if itemType == 1 then                -- temp items
            player:startEvent(unlockedEvent + 1,
                GetTempDrop(npc, 1),
                GetTempDrop(npc, 2),
                GetTempDrop(npc, 3),
                0, 0, 0, 0, 0)
        elseif itemType == 2 then            -- items
            player:startEvent(unlockedEvent,
                GetChestItem(npc, 1),
                GetChestItem(npc, 2),
                GetChestItem(npc, 3),
                GetChestItem(npc, 4),
                0, 0, 0, 0)
        end
    end
end

dsp.caskets.onTrade = function(player, npc, trade)
    local zoneId            = player:getZoneID()
    local ID                = zones[zoneId]
    local baseMessage       = ID.text.PLAYER_OBTAINS_TEMP_ITEM
    local locked            = npc:getLocalVar("LOCKED")
    local eventBase         = zones[zoneId].npc.CASKET_BASE               -- base id of the current chest.
    local lockedEvent       = casketInfo.cs[npc:getID() - eventBase] + 2  -- Chest locked cs's.
    local correctNumber     = npc:getLocalVar("CORRECT_NUM")
    local attemptsAllowed   = npc:getLocalVar("ATTEMPTS", attempts)
    local failedAtempts     = npc:getLocalVar("FAILED_ATEMPTS")
    local remainingAttempts = attemptsAllowed - failedAtempts
    local chestOwner        = npc:getLocalVar("PARTYID")                  -- the id of the player,party or alliance that has rights to the chest.
    local leaderId          = player:getLeaderID()

    if leaderId ~= chestOwner then
        return
    end

    if locked == 1 then
        if npcUtil.tradeHas(trade,1022,1) then
            GetDrops(npc, itemType, player:getZoneID())

            local splitNumbers = {}

            for digit in string.gmatch(tostring(correctNumber), "%d") do
               table.insert(splitNumbers, digit)
            end

            local randText = 0

            math.randomseed(os.time())

            randText = math.random(1,7)

            player:confirmTrade()

            if randText == 1 then
                if isEven(splitNumbers[1]) == true then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_FIRST_EVEN_ODD, 0, 0, 0, 0)
                else
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_FIRST_EVEN_ODD, 1, 0, 0, 0)
                end
            elseif randText == 2 then
                if isEven(splitNumbers[2]) == true then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_SECOND_EVEN_ODD, 0, 0, 0, 0)
                else
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_SECOND_EVEN_ODD, 1, 0, 0, 0)
                end
            elseif randText == 3 then
                if tonumber(splitNumbers[1]) <= 6 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                        splitNumbers[1],
                        splitNumbers[1] +1,
                        splitNumbers[1] +2, 0)
                elseif tonumber(splitNumbers[2]) == 9 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                        splitNumbers[2] -2,
                        splitNumbers[2] -1,
                        splitNumbers[2], 0)
                else
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                        splitNumbers[1] -1,
                        splitNumbers[1],
                        splitNumbers[1] +1, 0)
                end
            elseif randText == 4 then
                if tonumber(splitNumbers[2]) <= 6 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                        splitNumbers[2],
                        splitNumbers[2] +1,
                        splitNumbers[2] +2, 0)
                elseif tonumber(splitNumbers[2]) == 9 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                        splitNumbers[2] -2,
                        splitNumbers[2] -1,
                        splitNumbers[2], 0)
                else
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                        splitNumbers[2] -1,
                        splitNumbers[2],
                        splitNumbers[2] +1, 0)
                end
            elseif randText == 5 then
                player:messageSpecial(baseMessage + casketInfo.messageOffset.ONE_OF_TWO_DIGITS_IS,
                    splitNumbers[1], 0, 0, 0)
            elseif randText == 6 then
                player:messageSpecial(baseMessage + casketInfo.messageOffset.ONE_OF_TWO_DIGITS_IS,
                    splitNumbers[2], 0, 0, 0)
            elseif randText == 7 then
                local highNum = 0
                local lowNum  = 0
                local rand = math.random(1,9)

                if tonumber(splitNumbers[1]) == 1 then
                    lowNum  = 10
                    highNum = 20 + rand
                elseif tonumber(splitNumbers[1]) > 1 and tonumber(splitNumbers[1]) < 9 then
                    lowNum  = tonumber(splitNumbers[1]) * 10 - 10 + rand
                    highNum = tonumber(splitNumbers[1]) * 10 + 10 + rand
                elseif tonumber(splitNumbers[1]) == 9 then
                    lowNum  = 80 + rand
                    highNum = 99
                end
                player:messageSpecial(baseMessage + casketInfo.messageOffset.COMBINATION_GREATER_LESS, lowNum, highNum, 0, 0)
            else
                player:messageSpecial(baseMessage + casketInfo.messageOffset.UNABLE_TO_GET_HINT, 0, 0, 0, 0)
            end
        end
    end
end

dsp.caskets.onEventUpdate = function(player, csid, option, npc)
    -- nothing to see here keep scrolling.
end

dsp.caskets.onEventFinish = function(player, csid, option, npc)
    local zoneId = player:getZoneID()
    local ID = zones[zoneId]
    local baseMessage = ID.text.PLAYER_OBTAINS_TEMP_ITEM
    ------------------------------------------------------------------
    -- Basic chest var's
    ------------------------------------------------------------------
    local npc               = player:getEventTarget()
    local chestId           = npc:getID();
    local spawnStatus       = npc:getLocalVar("SPAWNSTATUS")
    local locked            = npc:getLocalVar("LOCKED")
    local lootType          = npc:getLocalVar("LOOT_TYPE")
    local eventBase         = zones[zoneId].npc.CASKET_BASE
    local lockedEvent       = casketInfo.cs[chestId - eventBase] + 2
    local unlockedEvent     = casketInfo.cs[chestId - eventBase]
    local lockedChoice      = bit.lshift(1, option -1)
    local inputNumber       = bit.rshift(option, 16)

    ----------------------------------------------------------------------
    -- Chest Locked var's
    ----------------------------------------------------------------------
    local correctNumber     = npc:getLocalVar("CORRECT_NUM")
    local currentAtempts    = npc:getLocalVar("CURRENT_ATEMPTS")
    local attemptsAllowed   = npc:getLocalVar("ATTEMPTS", attempts)
    local failedAtempts     = npc:getLocalVar("FAILED_ATEMPTS")
    local requiredGuesses   = npc:getLocalVar("REQUIREDGUESSES")
    local correctGuesses    = npc:getLocalVar("CORRECT_GUESSES")
    local remainingAttempts = attemptsAllowed - failedAtempts

    -- printf("option = %u ", option)
    ------------------------------------
    -- Minigame
    ------------------------------------

    local splitNumbers = {}

    for digit in string.gmatch(tostring(correctNumber), "%d") do
        table.insert(splitNumbers, digit)
    end

    if locked == 1 then
        -- print(correctNumber) -- dont cheat :)
        if option > 0 and spawnStatus ~= casketInfo.spawnStatus.SPAWNED_CLOSED then -- prevent minigame from working if chest is opened.
            return
        end
        --------------------------------------------
        -- Hints
        --------------------------------------------
        if lockedChoice == 2 then
            if option == 258 then
                local randText = 0
                randText = math.random(1,7)

                if randText == 1 then
                    if isEven(splitNumbers[1]) == true then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_FIRST_EVEN_ODD, 0, 0, 0, 0)
                        npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                        CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                    else
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_FIRST_EVEN_ODD, 1, 0, 0, 0)
                        npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                        CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                    end
                elseif randText == 2 then
                    if isEven(splitNumbers[2]) == true then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_SECOND_EVEN_ODD, 0, 0, 0, 0)
                        npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                        CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                    else
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_SECOND_EVEN_ODD, 1, 0, 0, 0)
                        npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                        CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                    end
                elseif randText == 3 then
                    if tonumber(splitNumbers[1]) <= 6 then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                            splitNumbers[1],
                            splitNumbers[1] +1,
                            splitNumbers[1] +2, 0)
                    elseif tonumber(splitNumbers[2]) == 9 then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                            splitNumbers[2] -2,
                            splitNumbers[2] -1,
                            splitNumbers[2], 0)
                    else
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                            splitNumbers[1] -1,
                            splitNumbers[1],
                            splitNumbers[1] +1, 0)
                    end
                    npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                    CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                elseif randText == 4 then
                    if tonumber(splitNumbers[2]) <= 6 then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                            splitNumbers[2],
                            splitNumbers[2] +1,
                            splitNumbers[2] +2, 0)
                    elseif tonumber(splitNumbers[2]) == 9 then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                            splitNumbers[2] -2,
                            splitNumbers[2] -1,
                            splitNumbers[2], 0)
                    else
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                            splitNumbers[2] -1,
                            splitNumbers[2],
                            splitNumbers[2] +1, 0)
                    end
                    npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                    CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                elseif randText == 5 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.ONE_OF_TWO_DIGITS_IS,
                        splitNumbers[1], 0, 0, 0)
                    npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                    CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                elseif randText == 6 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.ONE_OF_TWO_DIGITS_IS,
                        splitNumbers[2], 0, 0, 0)
                    npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                    CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                elseif randText == 7 then
                    local highNum = 0
                    local lowNum  = 0
                    local rand = math.random(1,9)

                    if tonumber(splitNumbers[1]) == 1 then
                        lowNum  = 10
                        highNum = 20 + rand
                    elseif tonumber(splitNumbers[1]) > 1 and tonumber(splitNumbers[1]) < 9 then
                        lowNum  = tonumber(splitNumbers[1]) * 10 - 10 + rand
                        highNum = tonumber(splitNumbers[1]) * 10 + 10 + rand
                    elseif tonumber(splitNumbers[1]) == 9 then
                        lowNum  = 80 + rand
                        highNum = 99
                    end

                    player:messageSpecial(baseMessage + casketInfo.messageOffset.COMBINATION_GREATER_LESS, lowNum, highNum, 0, 0)
                    npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                    CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                else
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.UNABLE_TO_GET_HINT, 0, 0, 0, 0)
                end
            end
        --------------------------------------------
        -- Inputs
        --------------------------------------------
        elseif lockedChoice == 1 then
            if inputNumber > 10 and inputNumber < 100 then
                local splitNumbers = {}

                for digit in string.gmatch(tostring(correctNumber), "%d") do
                    table.insert(splitNumbers,digit)
                end

                if inputNumber == correctNumber then
                    if locked == 0 then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.NO_COMBINATION, 0, 0, 0, 0)
                    else
                        MessageChest(player,"OPENED_LOCK",0 ,0, 0, 0, npc)
                        npc:setLocalVar("LOCKED", 0)

                        if npc:getLocalVar("SPAWNSTATUS") == casketInfo.spawnStatus.SPAWNED_CLOSED then  -- is the chest shut?, then open it.
                           npc:AnimationSub(1)
                           npc:setLocalVar("SPAWNSTATUS", casketInfo.spawnStatus.SPAWNED_OPEN)
                        end
                    end
                else
                    if inputNumber < correctNumber then
                        if locked == 0 then
                            player:messageSpecial(baseMessage + casketInfo.messageOffset.NO_COMBINATION, 0, 0, 0, 0)
                        else
                            player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_GREATER_LESS, inputNumber, 0, 0, 0, 0)
                            npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                            CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                        end
                    elseif inputNumber > correctNumber then
                        if locked == 0 then
                            player:messageSpecial(baseMessage + casketInfo.messageOffset.NO_COMBINATION, 0, 0, 0, 0)
                        else
                            player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_GREATER_LESS, inputNumber, 1, 0, 0, 0)
                            npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                            CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                        end
                    end
                end
            end
        end
    elseif locked == 0 then
        if lootType == 1 then
            if option == 65537 then
                GiveTempItem(player, npc, 1)
            elseif option == 65538 then
                GiveTempItem(player, npc, 2)
            elseif option == 65539 then
                GiveTempItem(player, npc, 3)
            end
        elseif lootType == 2 then
            if option == 65537 then
                GiveItem(player, npc, 1)
            elseif option == 65538 then
                GiveItem(player, npc, 2)
            elseif option == 65539 then
                GiveItem(player, npc, 3)
            elseif option == 65540 then
                GiveItem(player, npc, 4)
            end
        end
    end
end

----------------------------------------------------------------------
-- Casket data functions
----------------------------------------------------------------------
function SetCasketData(player, x, y, z, r, npc, partyID)
    ---------------------------------------------------------------------------------------------------
    -- NOTE: Super Kupowers Myriad Mystery Boxes add an additional 20% chance the chest will be locked.
    ---------------------------------------------------------------------------------------------------
    local kupowersMMB      = 0 -- Super Kupowers Myriad Mystery Boxes not implimented yet.
    local kupowersMMBPower = 0
    local typeChance       = math.random()
    local partyId          = partyID
    local chestId          = npc:getID()
    local chestStyle       = 965
    local correctNum       = math.random(11, 99)
    local attempts         = math.random(4, 6)

    --kupowersMMB = dsp.effect.KUPOWERS_MYRIAD_MYSTERY_BOXES

    --if player:hasStatusEffect(kupowersMMB) then
    --    kupowersMMBPower = 0.2
    --end

    if typeChance < 0.2 + kupowersMMBPower then
        chestStyle = 966 -- Brown locked
    else
        chestStyle = 965 -- Blue
    end

    if npc ~= nil then
        npc:resetLocalVars()
        npc:setAnimation(0)
        npc:AnimationSub(4)
        -------------------------------------
        -- Chest data
        -------------------------------------
        npc:setLocalVar("PARTYID", partyId)
        npc:setLocalVar("ITEMS_SET", 0)

        if chestStyle == 966 then
            npc:setLocalVar("ATTEMPTS", attempts)
            npc:setLocalVar("CORRECT_NUM", correctNum)
            npc:setLocalVar("FAILED_ATEMPTS", 0)
            npc:setLocalVar("LOCKED", 1)
            npc:setLocalVar("LOOT_TYPE", 2)
        else
            npc:setLocalVar("LOCKED", 0)
            npc:setLocalVar("LOOT_TYPE", 1)
        end

        npc:setLocalVar("SPAWNSTATUS", casketInfo.spawnStatus.SPAWNED_CLOSED)
        npc:setLocalVar("SPAWNTIME", os.time())
        npc:setPos(x, y, z, r)
        npc:setStatus(dsp.status.NORMAL)
        npc:entityAnimationPacket("deru")
        SendChestDropMessage(player)
        npc:setModelId(chestStyle)
        -------------------------------------------------------
        -- Despawn chest after 3 Mins
        -------------------------------------------------------
        npc:timer(180000, function(npc)
            RemoveChest(player, npc)
        end)
    end
end

function GetDrops(npc, dropType, zoneId)
    local chestType = casketInfo.dropTypes[dropType]

    if npc:getLocalVar("ITEMS_SET") == 1 then
        return
    end

    ----------------------------------------------
    -- Temp drops
    ----------------------------------------------
    if chestType == "tempItems" then
        local temps        = {0, 0, 0}
        local tempCount    = 1
        local randomTable  = {1,3,1,2,1,1,1,1,3,1,2,1}

        tempCount = randomTable[math.random(1, #randomTable)]

        for i = 1, tempCount do
            local tempDrops = casketItems[zoneId].temps
            local sum = 0

            for k, v in pairs(tempDrops) do
                sum = sum + v[1]
            end

            local rand = math.random() * sum -- note: NOT math.random(sum). That will truncate the fractional part of sum
            local temp = 0

            for k, v in pairs(tempDrops) do
                rand = rand - v[1]
                if rand <= 0 then
                   temp = v[2]
                   break
                end
            end
            if temp == 0 or temp == nil then
                temps[i] = 4112 -- default to potion
            else
                temps[i] = temp
            end
        end
        SetTempItems(npc, temps[1], temps[2], temps[3])
    ----------------------------------------------
    -- Item drops
    ----------------------------------------------
    elseif chestType == "items" then
        local items        = {0, 0, 0, 0}
        local itemCount    = 1
        local randomTable  = {1,4,1,3,1,1,2,1,3,1,2,1}

        itemCount = randomTable[math.random(1, #randomTable)]

        for i = 1, itemCount do
            local drops = casketItems[zoneId].items
            local sum = 0

            for k, v in pairs(drops) do
                sum = sum + v[1]
            end

            local rand = math.random() * sum -- note: NOT math.random(sum). That will truncate the fractional part of sum
            local item = 0

            for k, v in pairs(drops) do
                rand = rand - v[1]
                if rand <= 0 then
                   item = v[2]
                   break
                end
            end
            if item == 0 or item == nil then
                items[i] = 4112 -- default to potion
            else
                if math.random() < 0.05 then
                    items[i] = casketItems[zoneId].regionalItems[math.random(1, #casketItems[zoneId].regionalItems)]
                else
                    items[i] = item
                end
            end
        end

        SetItems(npc, items[1], items[2], items[3], items[4])
    ----------------------------------------------
    -- Evolith drops
    ----------------------------------------------
    elseif chestType == "evolith" then
        local evolith = 2783
        -- NOTE: Not implimented yet and will be incorperated into items once implimented.
        -- this is mainly here as a means of testing before implimentation.
    end
end

function SendChestDropMessage(player)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local dropMessage = ID.text.PLAYER_OBTAINS_TEMP_ITEM + casketInfo.messageOffset.MONSTER_CONCEALED_CHEST
    local party       = {}

    party = player:getAlliance()

    for _,member in ipairs(party) do
        if member:getZoneID() == player:getZoneID() then
            member:messageSpecial(dropMessage , 0)
        end
    end
end

----------------------------------------------------------------------------------
-- Temp item functions
----------------------------------------------------------------------------------
function GetTempDrop(npc, tempNum)
    local query = string.format("TEMP" ..tempNum.. "")
    local var   = npc:getLocalVar(query)

    if var == nil then
        return 0
    else
        return var
    end
end

function SetTempItems(npc, temp1, temp2, temp3)
    npc:setLocalVar("TEMP1", temp1)
    npc:setLocalVar("TEMP2", temp2)
    npc:setLocalVar("TEMP3", temp3)
    npc:setLocalVar("ITEMS_SET", 1)
end

function GiveTempItem(player, npc, tempNum)
    local tempQuery   = string.format("TEMP" ..tempNum.. "")
    local tempID      = npc:getLocalVar(tempQuery)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local spawnStatus = npc:getLocalVar("SPAWNSTATUS")

    if spawnStatus == casketInfo.spawnStatus.DESPAWNED then
        player:PrintToPlayer("The chest had already disappeared!", 13)
        return
    end

    if tempID == 0 then
        player:messageSpecial(ID.text.UNABLE_TO_OBTAIN_ITEM)
        return
    else
        if player:hasItem(tempID, 3) then
            return player:messageSpecial(ID.text.ALREADY_POSSESS_TEMP)
        else
            if player:addTempItem(tempID) then
                MessageChest(player, "PLAYER_OBTAINS_TEMP_ITEM", tempID, 0, 0, 0)
                npc:setLocalVar(tempQuery, 0)
                CheckTempChestIsEmpty(player, npc)
            end
        end
    end
end

function CheckTempChestIsEmpty(player, npc)
    local temp1 = npc:getLocalVar("TEMP1")
    local temp2 = npc:getLocalVar("TEMP2")
    local temp3 = npc:getLocalVar("TEMP3")

    if temp1 == 0 and temp2 == 0 and temp3 == 0 then
        RemoveChest(player, npc)
    end
end

----------------------------------------------------------------------------------
-- Basic item functions
----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- Desc: Returns an items id based on the the local variable i.e. npc:getLocalVariable("ITEM1").
------------------------------------------------------------------------------------------------
function GetChestItem(npc, slot)
    local query = string.format("ITEM" ..slot.. "")
    local var   = npc:getLocalVar(query)

    if var == nil then
        return 0
    else
        return var
    end
end

------------------------------------------------------------------------------------------------
-- Desc: Sets the items id in a local variable for the casket.
------------------------------------------------------------------------------------------------
function SetItems(npc, item1, item2, item3, item4)
    npc:setLocalVar("ITEM1", item1)
    npc:setLocalVar("ITEM2", item2)
    npc:setLocalVar("ITEM3", item3)
    npc:setLocalVar("ITEM4", item4)
    npc:setLocalVar("ITEMS_SET", 1)
end

------------------------------------------------------------------------------------------------
-- Desc: Gives the player the item from a casket based on the selection of the csid
------------------------------------------------------------------------------------------------
function GiveItem(player, npc, itemNum)
    local itemQuery   = string.format("ITEM" ..itemNum.. "")
    local itemID      = npc:getLocalVar(itemQuery)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local spawnStatus = npc:getLocalVar("SPAWNSTATUS")

    if spawnStatus == casketInfo.spawnStatus.DESPAWNED then
        player:PrintToPlayer("The chest had already disappeared!", 13)
        return
    end

    if itemID == 0 then
        player:messageSpecial(ID.text.UNABLE_TO_OBTAIN_ITEM)
        return
    else
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemID)
            return
        elseif player:getFreeSlotsCount() > 0 then
            if itemID ~= 0 then
                if MultipleItemCheck(itemID) == true then
                    if player:addItem(itemID, 33) then
                        MessageChest(player, "PLAYER_OBTAINS_ITEM", itemID, 0, 0, 0)
                        npc:setLocalVar(itemQuery, 0)
                        CheckItemChestIsEmpty(player, npc)
                    end
                else
                    if player:addItem(itemID) then
                        MessageChest(player, "PLAYER_OBTAINS_ITEM", itemID, 0, 0, 0)
                        npc:setLocalVar(itemQuery, 0)
                         CheckItemChestIsEmpty(player, npc)
                    end
                end
            end
        end
    end
end

function MultipleItemCheck(itemId)
    local multiples = {1214, 1215, 1211, 1212, 1213, 1217, 1222, 1962}

    for i = 1, #multiples do
        if (itemId == multiples[i]) then
            return true
        end
    end
    return false
end

------------------------------------------------------------------------------------------------
-- Desc: Checks to see if all the items have been removed from the casket then removes it.
------------------------------------------------------------------------------------------------
function CheckItemChestIsEmpty(player, npc)
    local item1 = npc:getLocalVar("ITEM1")
    local item2 = npc:getLocalVar("ITEM2")
    local item3 = npc:getLocalVar("ITEM3")
    local item4 = npc:getLocalVar("ITEM4")

    if item1 == 0 and item2 == 0 and item3 == 0 and item4 == 0 then
        RemoveChest(player, npc)
    end
end

----------------------------------------------------------------------
-- ******Additional Functions******
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Desc: Messages sent to all players in a party in the zone
----------------------------------------------------------------------
function MessageChest(player, messageId, param1, param2, param3, param4, npc)
    local zoneId  = player:getZoneID()
    local ID      = zones[zoneId]
    local msgBase = 0

    if messageId == "UNABLE_TO_OPEN_LOCK" then
        msgBase = ID.text.UNABLE_TO_OPEN_LOCK

    elseif messageId == "OPENED_LOCK" then
        msgBase = ID.text.OPENED_LOCK

    elseif messageId == "PLAYER_OBTAINS_ITEM" then
        msgBase = ID.text.PLAYER_OBTAINS_ITEM

    elseif messageId == "PLAYER_OBTAINS_TEMP_ITEM" then
        msgBase = ID.text.PLAYER_OBTAINS_TEMP_ITEM
    end

    for _, member in pairs(player:getAlliance()) do
        if member:getZoneID() == player:getZoneID() then
            member:messageName(msgBase, player, param1, param2, param3, param4, nil)
        end
    end
end

----------------------------------------------------------------------------------
-- Desc: Despawn a chest and reset its local var's
----------------------------------------------------------------------------------
function RemoveChest(player, npc)
    local chestId  = npc:getID()
    local chest    = GetNPCByID(chestId)

    npc:AnimationSub(0)
    npc:entityAnimationPacket("kesu")
    npc:setStatus(dsp.status.DISAPPEAR)
    npc:setLocalVar("SPAWNSTATUS", casketInfo.spawnStatus.DESPAWNED)
end

----------------------------------------------------------------------------------
-- Desc: Checks attempts and despawns the chest if all attempts have been used up.
----------------------------------------------------------------------------------
function CheckRemainingAttempts(player, npc, remaining, correctNumber)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local baseMessage = ID.text.PLAYER_OBTAINS_TEMP_ITEM

    if remaining == 1 then
        player:messageSpecial(baseMessage + casketInfo.messageOffset.CORRECT_NUMBER_WAS, correctNumber, 0, 0, 0, 0)
        MessageChest(player, "UNABLE_TO_OPEN_LOCK", 0, 0, 0, 0, npc)
        RemoveChest(player, npc)
    end
end

----------------------------------------------------------------------------------
-- Desc: Checks number to see if they are even or not for the locked minigame.
----------------------------------------------------------------------------------
function isEven(number)
    if number % 2 == 0 then
        return true
    else
        return false
    end
end

----------------------------------------------------------------------------------
-- Desc: Helper function for making it easier to read time between spawns.
----------------------------------------------------------------------------------
function ConvertTime(rawTime)
   local rawSeconds = tonumber(rawTime)
   local timeTable = {0,0,0}

    timeTable[1] = string.format("%02.f", math.floor(rawSeconds/3600));
    timeTable[2] = string.format("%02.f", math.floor(rawSeconds/60 - (timeTable[1]*60)));
    timeTable[3] = string.format("%02.f", math.floor(rawSeconds - timeTable[1]*3600 - timeTable[2] *60));

    return timeTable
end