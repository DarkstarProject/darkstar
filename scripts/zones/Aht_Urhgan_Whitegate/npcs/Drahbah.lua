-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Drahbah
-- Appraisal NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/IDs"] = nil
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
-----------------------------------
require("scripts/globals/instance")

local function appraiseItem(itemOrigin, itemType)
    local chance = math.random(100)

    local rewards = {}
    if itemType == "sword" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_07 then
            if chance <= 10 then
                rewards = { 17716 } -- Macuahuitl-1
            else
                rewards = { 16530, 16535, 16583, 16600, 16978, 18366 }
                -- Xiphos, Bronze Sword, Claymore, Wax Sword, Uchigatana+1, Gust Claymore
            end
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_09 then
            if chance <= 10 then
                rewards = { 17660 } -- Kilij
            else
                rewards = { 16530, 16535, 16583, 16600, 16978, 18366 }
                -- Xiphos, Bronze Sword, Claymore, Wax Sword, Uchigatana+1, Gust Claymore
            end
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_13 then
            rewards = { 16978, 18366, 18387 } 
            -- Uchigatana+1, Gust Claymore, Djinnbringer
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_14 then
            rewards = { 16978, 17661, 17703, 18366, 18433 } 
            -- Uchigatana+1, Storm Schimitar, Pealing Anelace, Gust Claymore, Kagiroi
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_15 then
            rewards = { 16978, 17703, 18366, 18433, 18387 } 
            -- Uchigatana+1, Pealing Anelace, Gust Claymore, Kagiroi, Djinnbringer
            if chance < 4 then
                return rewards[4]
            elseif chance >= 4 and chance < 8 then
                return rewards[2]
            elseif chance >= 8 and chance < 19 then
                return rewards[5]
            elseif chance >= 19 and chance < 58 then
                return rewards[1]
            else
                return rewards[3]
            end
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_17 then
            rewards = { 16978, 17700, 17721, 18366 } 
            -- Uchigatana+1, Durandal, Sanguine Sword, Gust Claymore
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_27 then
            rewards = { 16978, 18366, 18435, 18438 } 
            -- Uchigatana+1, Gust Claymore, Hotarumaru, Kumokirimaru
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_31 then
            rewards = { 16978, 18366, 18434 } 
            -- Uchigatana+1, Gust Claymore, Kosetsusamonji
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_36 then
            rewards = { 16978, 17726, 18366 } 
            -- Uchigatana+1, Immortal's Shotel, Gust Claymore, 
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_AMIKIRI then
            if chance <= 10 then
                rewards = { 16968 } -- Kamewari
            else
                rewards = { 16530, 16535, 16583, 16600, 16978, 18366 }
                -- Xiphos, Bronze Sword, Claymore, Wax Sword, Uchigatana+1, Gust Claymore
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_CARGO_CRAB_COLIN then
            if chance <= 10 then
                rewards = { 17650 } -- Nadrs
            else
                rewards = { 16530, 16535, 16583, 16600, 16978, 18366 }
                -- Xiphos, Bronze Sword, Claymore, Wax Sword, Uchigatana+1, Gust Claymore
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_CARNERO then
            if chance <= 10 then
                rewards = { 17811 } -- Katayama
            else
                rewards = { 16530, 16535, 16583, 16600, 16978, 18366 }
                -- Xiphos, Bronze Sword, Claymore, Wax Sword, Uchigatana+1, Gust Claymore
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_EMERGENT_ELM then
            if chance <= 10 then
                rewards = { 18386 } -- Gloom Claymore
            else
                rewards = { 16530, 16535, 16583, 16600, 16978, 18366 }
                -- Xiphos, Bronze Sword, Claymore, Wax Sword, Uchigatana+1, Gust Claymore
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_FROSTMANE then
            if chance <= 10 then
                rewards = { 16944 } -- Lockheart
            else
                rewards = { 16530, 16535, 16583, 16600, 16978, 18366 }
                -- Xiphos, Bronze Sword, Claymore, Wax Sword, Uchigatana+1, Gust Claymore
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_KEEPER_OF_HALIDOM then
            if chance <= 10 then
                rewards = { 16990 } -- Daihannya
            else
                rewards = { 16530, 16535, 16583, 16600, 16978, 18366 }
                -- Xiphos, Bronze Sword, Claymore, Wax Sword, Uchigatana+1, Gust Claymore
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_ZIZZY_ZILLAH then
            if chance <= 10 then
                rewards = { 18437 } -- Namikirimaru
            else
                rewards = { 16530, 16535, 16583, 16600, 16978, 18366 }
                -- Xiphos, Bronze Sword, Claymore, Wax Sword, Uchigatana+1, Gust Claymore
            end
        end
    elseif itemType == "dagger" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_05 then
            rewards = { 16399, 17625, 17780, 17984, 18008, 18361, 18364 }
            -- Katars, Ponderous Gully, Kyofu, Spark Dagger, Hushed Dagger, Ponderous Manoples, Pahluwan Katars
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_06 then
            rewards = { 17780, 17984, 17997, 18008, 18027 }
            -- Kyofu, Spark Dagger, Argent Dagger, Hushed Dagger, Palladium Dagger
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_24 then
            rewards = { 16399, 17625, 17780, 17984, 18008, 18361, 18415, 18416 }
            -- Katars, Ponderous Gully, Kyofu, Spark Dagger, Hushed Dagger, Ponderous Manoples, Tojaku, Karasuageha
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_45 then
            rewards = { 16399, 17625, 17780, 17984, 18008, 18017, 18361, 18415 }
            -- Katars, Ponderous Gully, Kyofu, Spark Dagger, Hushed Dagger, Assassin's Jambiya, Ponderous Manoples, Tojaku 
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_DRAGGERCLAW_DRACOS then
            if chance <= 10 then
                rewards = { 16434 } -- Sonic Knuckles
            else
                rewards = { 16399, 17625, 17984 }
                -- Katars, Ponderous Gully, Hushed Dagger
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_MISCHIEVOUS_MICHOLAS then
            if chance <= 10 then
                rewards = { 17618 } -- Kidney Dagger
            else
                rewards = { 16399, 17625, 17984 }
                -- Katars, Ponderous Gully, Hushed Dagger
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_NIGHTMARE_VASE then
            if chance <= 10 then
                rewards = { 16913 } -- Shinogi
            else
                rewards = { 16399, 17625, 17984 }
                -- Katars, Ponderous Gully, Hushed Dagger
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_ORCTRAP then
            if chance <= 10 then
                rewards = { 17792 } -- Nikkariaoe
            else
                rewards = { 16399, 17625, 17984 }
                -- Katars, Ponderous Gully, Hushed Dagger
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SABOTENDER_MARIACHI then
            if chance <= 10 then
                rewards = { 17981 } -- Bano Del Sol
            else
                rewards = { 16399, 17625, 17984 }
                -- Katars, Ponderous Gully, Hushed Dagger
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_STINGING_SOPHIE then
            if chance <= 10 then
                rewards = { 16486 } -- Beestinger
            else
                rewards = { 16399, 17625, 17984 }
                -- Katars, Ponderous Gully, Hushed Dagger
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_TOM_TIT_TAT then
            if chance <= 10 then
                rewards = { 16443 } -- Fruit Punches
            else
                rewards = { 16399, 17625, 17984 }
                -- Katars, Ponderous Gully, Hushed Dagger
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_WESTERN_SHADOW then
            if chance <= 10 then
                rewards = { 18752 } -- Retaliators
            else
                rewards = { 16399, 17625, 17984 }
                -- Katars, Ponderous Gully, Hushed Dagger
            end
        end
    elseif itemType == "polearm" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_13 or itemOrigin == dsp.appraisalOrigin.ASSAULT_14 or
            itemOrigin == dsp.appraisalOrigin.ASSAULT_15 or itemOrigin == dsp.appraisalOrigin.ASSAULT_17 or 
            itemOrigin == dsp.appraisalOrigin.ASSAULT_31 then
            rewards = { 18076 } -- Spark Spear
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_23 or itemOrigin == dsp.appraisalOrigin.ASSAULT_35 then
            rewards = { 1020 } -- Sickle
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_25 then
            rewards = { 16769, 17138, 17125, 17470, 17596, 18076, 18407 }
            -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Pealing Buzdygan, Steel-Splitter, Spark Spear, Imperial Wand
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_27 then
            local rewards = { 16769, 17124, 17138, 18076, 18843 } 
            -- Brass Zaghnal, Holly Pole+1, Willow Wand+1, Spark Spear, Flan Smasher
            return rewards[math.random(#rewards)]
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_32 then
            rewards = { 16769, 17138, 17125, 18076, 18112 }
            -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Spark Spear, Puk Lance
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_33 then
            rewards = { 16769, 17124, 17138, 17125, 18076, 18582 }
            -- Brass Zaghnal, Holly Pole+1, Holly Staff+1, Willow Wand+1, Spark Spear, Yigit Staff
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_36 then
            rewards = { 18076, 18078 }
            -- Spark Spear, Spark Lance
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_37 then
            rewards = { 18409 } -- Jadagna-1
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_43 then
            rewards = { 16769, 17138, 17125, 18076, 18064 }
            -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Spark Spear, Volunteer's Scythe
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_46 then
            rewards = { 16769, 17138, 17125, 17579, 18076, 18585 }
            -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Wyvern Perch, Spark Spear, Kinnara Pole
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_FALCATUS_ARANEI then
            if chance <= 10 then
                rewards = { 18040 } -- Webcutter
            else
                rewards = { 16769, 17138, 17125, 17124 }
                -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Holly Pole+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_HELLION then
            if chance <= 10 then
                rewards = { 18041 } -- A L'Outrance
            else
                rewards = { 16769, 17138, 17125, 17124 }
                -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Holly Pole+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_JUGGLER_HECATOMB then
            if chance <= 10 then
                rewards = { 16868 } -- Heavy Halberd
            else
                rewards = { 16769, 17138, 17125, 17124 }
                -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Holly Pole+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_NUNYENUNC then
            if chance <= 10 then
                rewards = { 18394 } -- Pilgrim's Wand
            else
                rewards = { 16769, 17138, 17125, 17124 }
                -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Holly Pole+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_ROC then
            if chance <= 10 then
                rewards = { 18587 } -- Dryad Staff
            else
                rewards = { 16769, 17138, 17125, 17124 }
                -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Holly Pole+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SWAMFISK then
            if chance <= 10 then
                rewards = { 17594 } -- Gelong Staff
            else
                rewards = { 16769, 17138, 17125, 17124 }
                -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Holly Pole+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_VOUIVRE then
            if chance <= 10 then
                rewards = { 16885 } -- Gae Bolg
            else
                rewards = { 16769, 17138, 17125, 17124 }
                -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Holly Pole+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_BONNACON then
            if chance <= 10 then
                rewards = { 18052 } -- Tredecim Scythe
            else
                rewards = { 16769, 17138, 17125, 17124 }
                -- Brass Zaghnal, Holly Staff+1, Willow Wand+1, Holly Pole+1
            end
        end
    elseif itemType == "axe" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_25 or itemOrigin == dsp.appraisalOrigin.ASSAULT_27 or 
            itemOrigin == dsp.appraisalOrigin.ASSAULT_32 or itemOrigin == dsp.appraisalOrigin.ASSAULT_33 or
            itemOrigin == dsp.appraisalOrigin.ASSAULT_43 then
            rewards = { 605 } -- Pickaxe
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_23 then
            rewards = { 1021, 17943, 18220, 18484 }
            -- Hatchet, Tomahawk+1, Prominence Axe, Wamoura Axe
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_35 then
            rewards = { 1021, 17943, 17949, 17950, 18220, 18225 }
            -- Hatchet, Tomahawk+1, Furnace Tabarzin, Marid Ancus, Prominence Axe, Blizzard Toporok
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_46 then
            rewards = { 605, 1021, 17943, 18217, 18220, 18487 }
            -- Pickaxe, Hatchet, Tomahawk+1, Rampager, Prominence Axe, Erik's Axe
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_BAT_EYE then
            if chance <= 10 then
                rewards = { 16675 } -- Storm Axe
            else
                rewards = { 1021, 17943 }
                -- Hatchet, Tamahawk+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_AQUARIUS then
            if chance <= 10 then
                rewards = { 17925 } -- Fransisca
            else
                rewards = { 1021, 17943 }
                -- Hatchet, Tamahawk+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_NORTHERN_SHADOW then
            if chance <= 10 then
                rewards = { 16723 } -- Executioner
            else
                rewards = { 1021, 17943 }
                -- Hatchet, Tamahawk+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_TRICKSTER_KINETIX then
            if chance <= 10 then
                rewards = { 16657 } -- Tabar
            else
                rewards = { 1021, 17943 }
                -- Hatchet, Tamahawk+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_TYRANNIC_TUNNOK then
            if chance <= 10 then
                rewards = { 17927 } -- Lohar
            else
                rewards = { 1021, 17943 }
                -- Hatchet, Tamahawk+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_PANZER_PERCIVAL then
            if chance <= 10 then
                rewards = { 16714 } -- Neckchopper
            else
                rewards = { 1021, 17943 }
                -- Hatchet, Tamahawk+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_PEG_POWLER then
            if chance <= 10 then
                rewards = { 16728 } -- Schwarz Axe
            else
                rewards = { 1021, 17943 }
                -- Hatchet, Tamahawk+1
            end
        end
    elseif itemType == "bow" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_34 then
            rewards = { 17177, 17225, 17252, 18147, 18684 } 
            -- Longbow+1, Crossbow+1, Culverin, Culverin+1, Storm Zamburak
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_42 then
            rewards = { 17177, 17225, 18683 } 
            -- Longbow+1, Crossbow+1, 
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_47 then
            rewards = { 5332, 18688 } 
            -- Kabura Quiver, Lamian Kaman-1
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_GYRE_CARLIN then
            if chance <= 10 then
                rewards = { 17247 } -- Rikonodo
            else
                rewards = { 17177, 17225 }
                -- Longbow+1, Crossbow+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_UNGUR then
            if chance <= 10 then
                rewards = { 18141 } -- Ungur Boomerang
            else
                rewards = { 17177, 17225 }
                -- Longbow+1, Crossbow+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_EASTERN_SHAODW then
            if chance <= 10 then
                rewards = { 18714 } -- Vali's Bow
            else
                rewards = { 17177, 17225 }
                -- Longbow+1, Crossbow+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_FRAELISSA then
            if chance <= 10 then
                rewards = { 17211 } -- Almogavar Bow
            else
                rewards = { 17177, 17225 }
                -- Longbow+1, Crossbow+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_HELLDIVER then
            if chance <= 10 then
                rewards = { 17281 } -- Wingedge
            else
                rewards = { 17177, 17225 }
                -- Longbow+1, Crossbow+1
            end
        end
    elseif itemType == "gloves" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_02 then
            rewards = { 14937 } -- Storm Gages
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_06 then
            rewards = { 12695, 12696, 12721, 12728, 14871, 14951 } 
            -- Bronze Mittens+1, Leather Gloves, Cotton Gloves, Cuffs, Trainer's Gloves, Dragon Kote
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_10 then
            rewards = { 12695, 12696, 12721, 12728, 14999, 15000 } 
            -- Bronze Mittens+1, Leather Gloves, Cotton Gloves, Cuffs, Vampiric Mitts, Caballero Gauntlets
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_31 then
            rewards = { 12695, 12696, 12721, 12728, 14936 } 
            -- Bronze Mittens+1, Leather Gloves, Cotton Gloves, Cuffs, Storm Manopolas
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_32 then
            rewards = { 12695, 12696, 12721, 12728, 14937 } 
            -- Bronze Mittens+1, Leather Gloves, Cotton Gloves, Cuffs, Storm Gages
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_37 then
            rewards = { 13960, 14952 } 
            -- Beak Gaunlets+1, Ice Gauntlets
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_40 then
            rewards = { 12695, 12696, 12721, 15001 } 
            -- Bronze Mittens+1, Leather Gloves, Cotton Gloves, Breeder Mufflers
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_47 then
            rewards = { 12695, 12696, 12721, 12728, 13956, 14939, 14953, 14954 } 
            -- Bronze Mittens+1, Leather Gloves, Cotton Gloves, Cuffs, Scorpion Mittens+1, Akinji Bazubands, Sadhu Bracelets, Sadhu Cuffs
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_PEALLAIDH then
            if chance <= 10 then
                rewards = { 14946 } -- Nightmare Gloves
            else
                rewards = { 12695, 12696, 12721, 12728 }
                -- Bronze Mittens+1, Leather Gloves, Cotton Gloves, Cuffs
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_ENERGETIC_ERUCA then
            if chance <= 10 then
                rewards = { 14947 } -- Hanzo Tekko
            else
                rewards = { 12695, 12696, 12721, 12728 }
                -- Bronze Mittens+1, Leather Gloves, Cotton Gloves, Cuffs
            end
        end
    elseif itemType == "footwear" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_07 then
            rewards = { 12951, 12952, 12984, 12992, 15325, 15705 }
            -- Bronze Leggings+1, Leather Highboots, Ash Clogs, Solea, Evoker's Boots, Ataractic Solea
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_20 then
            rewards = { 12951, 12952, 12984, 15744, 15745 }
            -- Bronze Leggings+1, Leather Highboots, Ash Clogs, Bowman's Ledelsens, Vampiric Boots
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_42 then
            rewards = { 12951, 12952, 12984, 12992, 15691 }
            -- Bronze Leggings+1, Leather Highboots, Ash Clogs, Soleas, Storm Gambieras
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_43 then
            rewards = { 12951, 12952, 12984, 15692 }
            -- Bronze Leggings+1, Leather Highboots, Ash Clogs, Storm Crackows
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_LEAPING_LIZZY then
            if chance <= 10 then
                rewards = { 15351 } -- Bounding Boots
            else
                rewards = { 12951, 12952, 12984 }
                -- Bronze Leggings+1, Leather Highboots, Ash Clogs
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_CACTUAR_CANTAUTOR then
            if chance <= 10 then
                rewards = { 14128 } -- Kung Fu Shoes
            else
                rewards = { 12951, 12952, 12984 }
                -- Bronze Leggings+1, Leather Highboots, Ash Clogs
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SIMURGH then
            if chance <= 10 then
                rewards = { 15736 } -- Trotter Boots
            else
                rewards = { 12951, 12952, 12984 }
                -- Bronze Leggings+1, Leather Highboots, Ash Clogs
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_BONNACON then
            if chance <= 10 then
                rewards = { 15323 } -- Cure Clogs
            else
                rewards = { 12951, 12952, 12984 }
                -- Bronze Leggings+1, Leather Highboots, Ash Clogs
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_TOTTERING_TOBY then
            if chance <= 10 then
                rewards = { 13013 } -- Stumbling Sandles
            else
                rewards = { 12951, 12952, 12984 }
                -- Bronze Leggings+1, Leather Highboots, Ash Clogs
            end
        end
    elseif itemType == "headpiece" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_13 then
            rewards = { 12440, 12463, 12465, 12472, 16065 }
            -- Leather Bandana, Bronze Cap+1, Cotton Headgear, Circlet, Storm Zuchetto
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_17 then
            rewards = { 12440, 12463, 12465, 12472, 15181, 16081 }
            -- Leather Bandana, Bronze Cap+1, Cotton Headgear, Circlet, Pineal Hat, Curate's Hat
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_23 then
            rewards = { 12440, 12463, 12465, 12472, 16066 }
            -- Leather Bandana, Bronze Cap+1, Cotton Headgear, Circlet, Storm Turban
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_30 then
            rewards = { 12440, 12463, 12465, 12472, 16125 }
            -- Leather Bandana, Bronze Cap+1, Cotton Headgear, Circlet, Breeder Mask
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_50 then
            rewards = { 12440, 12463, 12465, 12472, 16126, 16127 }
            -- Leather Bandana, Bronze Cap+1, Cotton Headgear, Circlet, Bowman's Mask, Carline Ribbon
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_TAISAIJIN then
            if chance <= 10 then
                rewards = { 15222 } -- Spelunker's Hat
            else
                rewards = { 12440, 12463, 12465, 12472 }
                -- Leather Bandana, Bronze Cap+1, Cotton Headgear, Circlet
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_VALKURM_EMPEROR then
            if chance <= 10 then
                rewards = { 15224 } -- Empress Hairpin
            else
                rewards = { 12440, 12463, 12465, 12472 }
                -- Leather Bandana, Bronze Cap+1, Cotton Headgear, Circlet
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_ELLYLLON then
            if chance <= 10 then
                rewards = { 13913 } -- Mushroom Helm
            else
                rewards = { 12440, 12463, 12465, 12472 }
                -- Leather Bandana, Bronze Cap+1, Cotton Headgear, Circlet
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_DROOLING_DAISY then
            if chance <= 10 then
                rewards = { 13838 } -- Dodge Headband
            else
                rewards = { 12440, 12463, 12465, 12472 }
                -- Leather Bandana, Bronze Cap+1, Cotton Headgear, Circlet
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SHARP_EARED_ROPIPI then
            if chance <= 10 then
                rewards = { 15218 } -- Entrancing Ribbon
            else
                rewards = { 12440, 12463, 12465, 12472 }
                -- Leather Bandana, Bronze Cap+1, Cotton Headgear, Circlet
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_TUMBLING_TRUFFLE then
            if chance <= 10 then
                rewards = { 12485 } -- Fungus Hat
            else
                rewards = { 12440, 12463, 12465, 12472 }
                -- Leather Bandana, Bronze Cap+1, Cotton Headgear, Circlet
            end
        end
    elseif itemType == "earring" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_09 then
            rewards = { 13313, 13321, 13323, 13327, 15985 }
            -- Shell Earring, Bone Earring, Beetle Earring, Silver Earring, Sigma Earring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_19 then
            rewards = { 13313, 13321, 13323, 13327, 15986 }
            -- Shell Earring, Bone Earring, Beetle Earring, Silver Earring, Eta Earring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_21 then
            rewards = { 13313, 13321, 13323, 13327, 14790, 15968 }
            -- Shell Earring, Bone Earring, Beetle Earring, Silver Earring, Reraise Earring, Storm Loop
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_26 then
            rewards = { 13313, 13321, 13323, 13327, 14761, 15980 }
            -- Shell Earring, Bone Earring, Beetle Earring, Silver Earring, Elusive Earring, Magnifying Earring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_29 then
            rewards = { 13313, 13321, 13323, 15987 }
            -- Shell Earring, Bone Earring, Beetle Earring, Epsilon Earring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_39 then
            rewards = { 13313, 13323, 13327, 15988 }
            -- Shell Earring, Beetle Earring, Silver Earring, Beta Earring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_40 then
            rewards = { 13313, 13321, 13323, 15995 }
            -- Shell Earring, Bone Earring, Beetle Earring, Carline Earring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_41 then
            rewards = { 13313, 13321, 13323, 13327, 14805, 15969 }
            -- Shell Earring, Bone Earring, Beetle Earring, Silver Earring, Heims Earring, Storm Earring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_49 then
            rewards = { 13313, 13321, 13327, 15989 }
            -- Shell Earring, Bone Earring, Silver Earring, Gamma Earring
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_LEECH_KING then
            if chance <= 10 then
                rewards = { 13359 } -- Bloodbead Earring
            else
                rewards = { 13313, 13321, 13323, 13327 }
                -- Shell Earring, Bone Earring, Beetle Earring, Silver Earring
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_CAPRICIOUS_CASSIE then
            if chance <= 10 then
                rewards = { 13402 } -- Cassie Earring
            else
                rewards = { 13313, 13321, 13323, 13327 }
                -- Shell Earring, Bone Earring, Beetle Earring, Silver Earring
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_MAIGHDEAN_UAINE then
            if chance <= 10 then
                rewards = { 14803 } -- Optical Earring
            else
                rewards = { 13313, 13321, 13323, 13327 }
                -- Shell Earring, Bone Earring, Beetle Earring, Silver Earring
            end
        end
    elseif itemType == "ring" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_01 then
            rewards = { 13454, 13465, 13514, 15773 }
            -- Copper Ring, Brass Ring, Archer Ring, Imperial Ring
            if chance < 2 then
                return rewards[4]
            elseif chance >= 2 and chance < 18 then
                return rewards[3]
            elseif chance >= 18 and chance < 55 then
                return rewards[2]
            else
                return rewards[1]
            end
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_07 then
            rewards = { 13454, 13465, 13466, 15786 }
            -- Copper Ring, Brass Ring, Orichalcum Ring, Divisor Ring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_08 then
            rewards = { 13454, 13465, 15794 }
            -- Copper Ring, Brass Ring, Omicron Ring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_11 then
            rewards = { 13454, 13465, 13549, 15774 }
            -- Copper Ring, Brass Ring, Ether Ring, Storm Ring
            if chance < 11 then
                return rewards[4]
            elseif chance >= 11 and chance < 17 then
                return rewards[3]
            elseif chance >= 17 and chance < 55 then
                return rewards[2]
            else
                return rewards[1]
            end
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_16 then
            rewards = { 13454, 13465, 15787 }
            -- Copper Ring, Brass Ring, Horizon Ring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_18 then
            rewards = { 13454, 13465, 15795 }
            -- Copper Ring, Brass Ring, Tau Ring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_28 then
            rewards = { 13454, 13465, 15796 }
            -- Copper Ring, Brass Ring, Psi Ring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_38 then
            rewards = { 13454, 13465, 15797 }
            -- Copper Ring, Brass Ring, Pi Ring
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_48 then
            rewards = { 13454, 13465, 15798 }
            -- Copper Ring, Brass Ring, Epsilon Ring
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SMOTHERING_SCHMIDT then
            if chance <= 10 then
                rewards = { 13507 } -- Malflood Ring
            else
                rewards = { 13454, 13465 }
                -- Copper Ring, Brass Ring 
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_ASPHYCIATED_AMSEL then
            if chance <= 10 then
                rewards = { 13512 } -- Malgust Ring
            else
                rewards = { 13454, 13465 }
                -- Copper Ring, Brass Ring 
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_CRUSHED_KRAUSE then
            if chance <= 10 then
                rewards = { 13508 } -- Maldust Ring
            else
                rewards = { 13454, 13465 }
                -- Copper Ring, Brass Ring 
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_PULVERIZED_PFEFFER then
            if chance <= 10 then
                rewards = { 13509 } -- Malfrost Ring
            else
                rewards = { 13454, 13465 }
                -- Copper Ring, Brass Ring 
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_BURNED_BERGMANN then
            if chance <= 10 then
                rewards = { 13510 } -- Malflame Ring
            else
                rewards = { 13454, 13465 }
                -- Copper Ring, Brass Ring 
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_WOUNDED_WURFEL then
            if chance <= 10 then
                rewards = { 13511 } -- Malflash Ring
            else
                rewards = { 13454, 13465 }
                -- Copper Ring, Brass Ring 
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_BLOODSUCKER then
            if chance <= 10 then
                rewards = { 13302 } -- Bloodbead Ring
            else
                rewards = { 13454, 13465 }
                -- Copper Ring, Brass Ring 
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SERKET then
            if chance <= 10 then
                rewards = { 13552 } -- Serket Ring
            else
                rewards = { 13454, 13465 }
                -- Copper Ring, Brass Ring 
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SEWER_SYRUP then
            if chance <= 10 then
                rewards = { 13303 } -- Jelly Ring
            else
                rewards = { 13454, 13465 }
                -- Copper Ring, Brass Ring 
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_BOMB_KING then
            if chance <= 10 then
                rewards = { 13506 } -- Bomb Ring
            else
                rewards = { 13454, 13465 }
                -- Copper Ring, Brass Ring 
            end
        end
    elseif itemType == "cape" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_03 then
            rewards = { 13600, 13601, 13608, 13611, 15483 }
            -- Dhalmel Mantle+1, Cotton Cape+1, Lizard Mantle+1, Red Cape+1, Storm Mantle
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_16 then
            rewards = { 13600, 13601, 13608, 13678, 16220 }
            -- Dhalmel Mantle+1, Cotton Cape+1, Lizard Mantle+1, Sniper's Mantle, Volitional Mantle
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_22 then
            rewards = { 13600, 13601, 13608, 13624, 15489 }
            -- Dhalmel Mantle+1, Cotton Cape+1, Lizard Mantle+1, Enhancing Mantle, Storm Cape
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_36 then
            rewards = { 13600, 13601, 13608, 13679, 16221 }
            -- Dhalmel Mantle+1, Cotton Cape+1, Lizard Mantle+1, Templar's Mantle, Aileron Mantle
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_OLD_TWO_WINGS then
            if chance <= 10 then
                rewards = { 13598 } -- Bat Cape
            else
                rewards = { 13600, 13601, 13608 }
                -- Dhalmel Mantle+1, Cotton Cape+1, Lizard Mantle+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_FRAELISSA then
            if chance <= 10 then
                rewards = { 15469 } -- Bellicose Mantle
            else
                rewards = { 13600, 13601, 13608 }
                -- Dhalmel Mantle+1, Cotton Cape+1, Lizard Mantle+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SPINY_SPIPI then
            if chance <= 10 then
                rewards = { 13607 } -- Mist Silk Cape
            else
                rewards = { 13600, 13601, 13608 }
                -- Dhalmel Mantle+1, Cotton Cape+1, Lizard Mantle+1
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_GOLDEN_BAT then
            if chance <= 10 then
                rewards = { 13576 } -- Night Cape
            else
                rewards = { 13600, 13601, 13608 }
                -- Dhalmel Mantle+1, Cotton Cape+1, Lizard Mantle+1
            end
        end
    elseif itemType == "sash" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_04 then
            rewards = { 13224, 15453, 15454, 15460, 15461, 15881, 15882 }
            -- Silver Obi+1, Lugworm Belt, Little Worm Belt, Deductive Gold Obi, Enthralling Gold Obi, Talisman Obi, Storm Belt
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_09 then
            rewards = { 15453, 15454, 15881, 15904 }
            -- Lugworm Belt, Little Worm Belt, Talisman Obi, Theta Sash
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_19 then
            rewards = { 13224, 15453, 15454, 15881, 15903 }
            -- Silver Obi+1, Lugworm Belt, Little Worm Belt, Talisman Obi, Ksi Sash
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_26 then
            rewards = { 13224, 15293, 15453, 15881, 15897 }
            -- Silver Obi+1, Gleeman's Belt, Lugworm Belt, Talisman Obi, Grace Corset
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_29 then
            rewards = { 13224, 15453, 15881, 15902 }
            -- Silver Obi+1, Lugworm Belt, Talisman Obi, Lambda Sash
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_39 then
            rewards = { 13224, 15453, 15881, 15901 }
            -- Silver Obi+1, Lugworm Belt, Talisman Obi, Zeta Sash
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_44 then
            rewards = { 13224, 15453, 15867, 15868, 15870, 15881, 15883 }
            -- Silver Obi+1, Lugworm Belt, Sultan's Belt, Czar's Belt, Maharaja's Belt, Talisman Obi, Storm Sash
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_49 then
            rewards = { 13224, 15453, 15454, 15881, 15900 }
            -- Silver Obi+1, Lugworm Belt, Little Worm Belt, Talisman Obi, Nu Sash
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_JOLLY_GREEN then
            if chance <= 10 then
                rewards = { 13228 } -- Shaman's Belt
            else
                rewards = { 15453, 15454, 15881 }
                -- Lugworm Belt, Little Worm Belt, Talisman Obi
            end
        end
    elseif itemType == "shield" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_17 then
            rewards = { 16167 } -- Tariqah-1
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_30 then
            rewards = { 12289, 12290, 12291, 12293, 16169 }
            -- Lauan Shield, Maple Shield, Elm Shield, Oak Shield, Caballero Shield
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_33 then
            rewards = { 12289, 12290, 12291, 12292, 12293, 16165 }
            -- Lauan Shield, Maple Shield, Elm Shield, Mahogany Shield, Oak Shield, Storm Shield
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SOUTHERN_SHADOW then
            if chance <= 10 then
                rewards = { 12344 } -- Master Shield
            else
                rewards = { 12289, 12290, 12291, 12293 }
                -- Lauan Shield, Maple Shield, Elm Shield, Oak Shield
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_BLOODTEAR_BALDURF or 
                itemOrigin == dsp.appraisalOrigin.NYZUL_STEELFLEECE_BALDARICH then
                if chance <= 10 then
                    rewards = { 12356 } -- Viking Shield
                else
                    rewards = { 12289, 12290, 12291, 12293 }
                    -- Lauan Shield, Maple Shield, Elm Shield, Oak Shield
                end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_FUNGUS_BEETLE then
            if chance <= 10 then
                rewards = { 12371 } -- Clipeus
            else
                rewards = { 12289, 12290, 12291, 12293 }
                -- Lauan Shield, Maple Shield, Elm Shield, Oak Shield
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_PELICAN then
            if chance <= 10 then
                rewards = { 12382 } -- Astral Aspis
            else
                rewards = { 12289, 12290, 12291, 12293 }
                -- Lauan Shield, Maple Shield, Elm Shield, Oak Shield
            end
        end
    elseif itemType == "necklace" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_02 then
            rewards = { 13065, 13075, 13165, 15519 }
            -- Gorget+1, Feather Collar, Jagd Gorget, Storm Muffler
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_08 then
            rewards = { 13065, 13075, 15538 }
            -- Gorget+1, Feather Collar, Phi Necklace
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_12 then
            rewards = { 13065, 13075, 13128, 15520 }
            -- Gorget+1, Feather Collar, Spectacles, Storm Torque
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_18 then
            rewards = { 13065, 13075, 15537 }
            -- Gorget+1, Feather Collar, Kappa Necklace
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_28 then
            rewards = { 13065, 13075, 15536 }
            -- Gorget+1, Feather Collar, Rho Necklace
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_37 then
            rewards = { 13065, 13075, 13176, 15517 }
            -- Gorget+1, Feather Collar, Philomath Stole, Sniper's Collar
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_38 then
            rewards = { 13065, 13075, 15535 }
            -- Gorget+1, Feather Collar, Chi Necklace
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_48 then
            rewards = { 13065, 13075, 15534 }
            -- Gorget+1, Feather Collar, Mu Necklace
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SHADOW_EYE then
            if chance <= 10 then
                rewards = { 13114 } -- Moon Amulet
            else
                rewards = { 13065, 13075 }
                -- Gorget+1, Feather Collar
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_JAGGEDY_EARED_JACK then
            if chance <= 10 then
                rewards = { 13112 } -- Rabbit Charm
            else
                rewards = { 13065, 13075 }
                -- Gorget+1, Feather Collar
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_ARGUS then
            if chance <= 10 then
                rewards = { 15515 } -- Peacock Amulet
            else
                rewards = { 13065, 13075 }
                -- Gorget+1, Feather Collar
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_GARGANTUA then
            if chance <= 10 then
                rewards = { 13115 } -- Elemental Charm
            else
                rewards = { 13065, 13075 }
                -- Gorget+1, Feather Collar
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SERPOPARD_ISHTAR then
            if chance <= 10 then
                rewards = { 13086 } -- Cerulean Pendant
            else
                rewards = { 13065, 13075 }
                -- Gorget+1, Feather Collar
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_BLOODPOOL_VORAX then
            if chance <= 10 then
                rewards = { 13058 } -- Bloodbead Amulet
            else
                rewards = { 13065, 13075 }
                -- Gorget+1, Feather Collar
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_BUBURIMBOO then
            if chance <= 10 then
                rewards = { 13057 } -- Buburimu Gorget
            else
                rewards = { 13065, 13075 }
                -- Gorget+1, Feather Collar
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_DUNE_WIDOW then
            if chance <= 10 then
                rewards = { 13137 } -- Spider Torque
            else
                rewards = { 13065, 13075 }
                -- Gorget+1, Feather Collar
            end
        end
    elseif itemType == "ingot" then
    elseif itemType == "potion" then
    elseif itemType == "cloth" then
    elseif itemType == "box" then
        if itemOrigin == dsp.appraisalOrigin.ASSAULT_01 then
            rewards = 
            { 
                776, 1164, 1411, 1472, 1887, 2146, 2336, 4097, 5315, 5353, 5450 
                -- White Rock, Tsurara, Phalaenopsis, Gardenia Seed, Glass Sheet, Merrow Scale, Soulflayer Staff
                -- Ice Crystal, Toolbag: Jusa, Iron Bullet Pouch, Lakerda
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_02 then
            rewards = 
            { 
                776, 826, 1164, 1411, 1472, 2146, 2334, 2336, 4097
                -- White Rock, Linen Cloth, Tsurara, Phalaenopsis, Gardenia Seed, Merrow Scale, Poroggo Hat
                -- Soulflayer Staff, Ice Crystal
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_03 then
            rewards = 
            { 
                776, 1164, 1411, 1472, 1586, 1887, 2336, 2475, 4097, 5336, 5566
                -- White Rock, Tsurara, Phalaenopsis, Gardenia Seed, Titanictus Shell, Glass Sheet, Soulflayer Staff,
                -- Kaolin, Ice Crystal, Holy Bolt Quiver, Date
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_04 then
            rewards = 
            { 
                776, 1164, 1411, 1472, 2146, 2216, 2336, 4097, 5308, 5312, 5340
                -- White Rock, Tsurara, Phalaenopsis, Gardenia Seed, SMerrow Scale, Lamp Merimo, Soulflayer Staff,
                -- Ice Crystal, Toolbag: Uchi, Toolbag: Hira, Silver Bullet Pouch
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_05 then
            rewards = 
            { 
                776, 1164, 1411, 1472, 1887, 2146, 2336, 4097, 5338, 5341, 5353
                -- White Rock, Tsurara, Phalaenopsis, Gardenia Seed, Glass Sheet, Merrow Scale, Soulflayer Staff,
                -- Ice Crystal, Venum Bullet Pouch, Spartan Bullet Pouch, Iron Bullet Pouch,
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_06 then
            rewards = 
            { 
                776, 1164, 1411, 1472, 2336, 4097, 5335, 5338
                -- White Rock, Tsurara, Phalaenopsis, Gardenia Seed, Soulflayer Staff, Ice Crystal,
                -- Acid Bolt Quiver, Venom Bolt Quiver
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_07 then
            rewards = 
            { 
                776, 1164, 1411, 1472, 1887, 2146, 2336, 4097, 4222, 4225, 4226, 4227, 4229, 
                5310, 5313, 5314, 5319, 5334, 5335, 5338, 5353, 5363, 5566
                -- White Rock, Tsurara, Phalaenopsis, Gardenia Seed, Glass Sheet, Merrow Scale, Soulflayer Staff,
                -- Ice Crystal, Horn Quiver, Iron Quiver, Silver Quiver, Bronze Bolt Quiver, Darksteel Bolt Quiver,
                -- Toolbag: Kawa, Mizu, Shihei, Shino, Blind Bolt Quiver, Acid Bolt Quiver, Venom Bolt Quiver,
                -- Bullet Pouch, Date
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_08 then
            rewards = 
            { 
                776, 1164, 1411, 1472, 1887, 2146, 2336, 4097, 5310, 5318, 5332, 17303
                -- White Rock, Tsurara, Phalaenopsis, Gardenia Seed, Glass Sheet, Merrow Scale, Soulflayer Staff,
                -- Ice Crystal, Demon Quiver, Toolbag: Kawa, Kodo, Kabura Quiver, Manji Shuriken
                
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_09 then
            rewards = 
            { 
                776, 1164, 1411, 1472, 1887, 2146, 2336, 4097, 4219, 4221, 4222, 4224, 4227, 4228, 4229, 
                5308, 5310, 5313, 5314, 5317, 5334, 5335, 5336, 5337, 5339, 5340, 5353 
                -- White Rock, Tsurara, Phalaenopsis, Gardenia Seed, Glass Sheet, Merrow Scale, Soulflayer Staff,
                -- Ice Crystal, Stone Quiver, Beetle Quiver, Horn Quiver, Demon Quiver, Bronze Bolt Quiver,
                -- Mythril Bolt Quiver, Darksteel Bolt Quiver, Toolbag: Uchi, Kawa, Mizu, Shihei, Sai,
                -- Blind Bolt Quiver, Acid Bolt Quiver, Holy Bolt Quiver, Sleep Bolt Quiver, Bloody Bolt Quiver,
                -- Silver Bullet Pouch, Iron Bullet Pouch
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_10 then
            rewards = 
            { 
                1472, 2146, 2336, 4228, 5309, 5333, 5335, 5339
                -- Gardenia Seed, Merrow Scale, Soulflayer Staff, Mythril Bolt Quiver, Toolbag: Tsura, Sleep Quiver,
                -- Acid Bolt Quiver, Bloody Bolt Quiver
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_11 then
            rewards = 
            { 
                638, 829, 2156, 2227, 2334, 2475, 4387, 4388, 5308, 5309, 5310, 5314, 5453, 5566
                -- Sage, Silk Cloth, Imp. Tea Leaves, Mamool Ja Collar, Poroggo Hat, Kaolin, Wild Onion,
                -- Eggplant, Toolbag: Uchi, Tsura, Kawa, Shihei, Istakoz, Date
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_12 then
            rewards = 
            { 
                638, 2156, 2227, 2334, 2475, 4387, 4388, 5308, 5311, 5314, 5315, 5317, 5318, 5319, 5566 
                -- Sage, Imp. Tea Leaves, Mamool Ja Collar, Poroggo Hat, Kaolin, Wild Onion, Eggplant,
                -- Toolbag: Uchi, Maki, Shihei, Jusa, Sai, Kado, Shinobi, Date
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_13 then
            rewards =
            { 
                638, 645, 2156, 2227, 2334, 2336, 2475, 4388, 5313, 5314, 5315, 5316, 5566 
                -- Sage, Darksteel Ore, Imp. Tea Leaves, Mamool Ja Collar, Poroggo Hat, Soulflayer Staff,
                -- Kaolin, Eggplant, Toolbag: Mizu, Shihei, Jusa, Kagi, Date
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_14 then
            rewards =
            { 
                638, 2156, 2167, 2227, 2289, 2334, 2336, 4387, 4388, 5309, 5310, 5313, 5318, 5566 
                -- Sage, Imp. Tea Leaves, Lamian Armlet, Mamool Ja Collar, Wamoura Cloth, Poroggo Hat,
                -- Soulflayer Staff, Wild Onion, Eggplant, Toolbag: Tsura, Kawa, Mizu, Kodo, Date
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_15 then
            rewards =
            { 
                638, 2156, 2227, 2290, 2334, 2336, 2475, 4097, 4387, 4388, 5308, 5309, 5310, 5312, 
                5313, 5314, 5315, 5317, 5318, 5319, 5566 
                -- Sage, Imp. Tea Leaves, Mamool Ja Collar, Imp. Cermet, Poroggo Hat, Souflayer Staff, Kaolin,
                -- Ice Crystal, Wild Onion, Eggplant, Toolbag: Uchi, Tsura, Kawa, Hira, Mizu, Shihei, Jusa, Sai
                -- Toolbag: Kodo, Shinobi, Date
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_16 then
            rewards =
            { 
                1176, 2156, 2227, 2334, 2336, 4387, 4388, 5566 
                -- Mizu-Deppo, Imp. Tea Leaves, Mamool Ja Collar, Poroggo Hat, Soulflayer Staff, Wild Onion,
                -- Eggplant, Date
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_17 then
            rewards =
            { 
                638, 2156, 2227, 2334, 4387, 4388, 5311, 5312, 5316 
                -- Sage, Imp. Tea Leaves, Mamool Ja Collar, Poroggo Hat, Wild Onion, Eggplant,
                -- Toolbag: Maki, Hira, Kagi
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_18 then
            rewards =
            { 
                638, 2156, 2227, 2334, 4387, 4388, 5308, 5315, 5316, 5317 
                -- Sage, Imp. Tea Leaves, Mamool Ja Collar, Poroggo Hat, Wild Onion, Eggplant, 
                -- Toolbag: Uchi, Jusa, Kagi, Sai
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_19 then
            rewards =
            {
                2227, 2334, 2475, 4155, 4387, 5311, 5315, 5318, 5566 
                -- Mamool Ja Collar, Poroggo Hat, Kaolin, Remedy, Wild Onion, Toolbag: Maki, Jusa, Kodo, Date
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_20 then
            rewards =
            {
                2227, 2334, 5319, 5566 
                -- Mamool Ja Collar, Poroggo Hat, Toolbag: Shinobi, Date
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_21 then
            rewards =
            {
                640, 769, 828, 928, 1108, 1590, 2160, 2175, 2302, 5340, 5341, 5353, 5359, 5363 
                -- Copper Ore, Red Rock, Velvet Cloth, Bomb Ash, Sulfur, Holy Basil, Troll Pauldron, Flan Meat,
                -- Troll Bronze Ingot, Silver Bullet Pouch, Spartan Bullet Pouch, Iron Bullet Pouch,
                -- Bronze Bullet Pouch, Bullet Pouch
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_22 then
            rewards =
            {
                1108, 1590, 2160, 2175, 5341, 5363 
                -- Sulfur, Holy Basil, Troll Pauldron, Flan Meat, Spartan Bullet Pouch, Bullet Pounch
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_23 then
            rewards =
            {
                640, 703, 769, 928, 1108, 1590, 2160, 2175, 2302, 5340, 5353 
                -- Copper Ore, Petrified Log, Red Rock, Bomb Ash, Sulfur, Holy Basil, Troll Pauldron,
                -- Flan Meat, Troll Bronze Ingot, Silver Bullet Pouch, Iron Bullet Pouch
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_24 then
            rewards =
            {
                640, 769, 928, 1108, 1590, 2160, 2175, 2302, 2303, 5340, 5341, 5353, 5359, 5363 
                -- Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Troll Pauldron, Flan Meat, Troll Bronze Ingot
                -- Troll Bronze Sheet, Silver Bullet Pouch, Spartan Bullet Pouch, Iron Bullet Pouch, Bronze Bullet Pouch
                -- Bullet Pouch
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_25 then
            rewards =
            {
                640, 769, 928, 1108, 1590, 2160, 2175, 5312, 5340 
                -- Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Troll Pauldron, Flan Meat,
                -- Toolbag: Hira, Silver Bullet Pouch
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_26 then
            rewards =
            {
                640, 769, 928, 1108, 1590, 2160, 2175, 2302, 5340, 5341, 5353, 5568 
                -- Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Troll Pauldron, Flan Meat, Troll Bronze Ingot,
                -- Silver Bullet Pouch, Spartan Bullet Pouch, Iron Bullet Pouch, Apkallu Egg
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_27 then
            rewards =
            { 
                640, 769, 928, 1108, 1590, 2160, 2175, 5353, 5359 
                -- Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Troll Pauldron, Flan Meat,
                -- Iron Bullet Pouch, Bronze Bullet Pouch
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_28 then
            rewards =
            { 
                928, 1108, 1590, 2160, 2175, 2302, 5359 
                -- Bomb Ash, Sulfur, Holy Basil, troll Pauldron, Flan Meat, Troll bronze Ingot, Bronze Bullet Pouch
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_29 then
            rewards =
            { 
                640, 1590, 2160, 2175, 5341 
                -- Copper Ore, Holy Basil, Troll Pauldron, Flan Meat, Spartan Bullet Pouch
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_30 then
            rewards =
            { 
                1590, 2160, 2175, 2302, 5353 
                -- Holy Basil, Troll Pauldron, Flan Meat, Troll Bronze Ingot, Iron Bullet Pouch
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_31 then
            rewards =
            { 
                113, 821, 880, 1523, 1654, 2153, 2163, 4196, 4227, 4387, 5336, 5337 
                -- Cleaning Tool Set, Rainbow Thread, Bone Chip, Apple Mint, Igneous Rock, Qiqirn Sandbag,
                -- Imp Wing, Rotton Quiver, Bronze Bolt Quiver, Wild Onion, Holy Bolt Quiver, Sleep Bolt Quiver
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_32 then
            rewards =
            { 
                113, 867, 880, 1523, 1654, 2153, 2163, 4196, 4227, 5336 
                -- Cleaning Tool Set, Dragon Scales, Bone Chip, Apple Mint, Igneous Rock, Qiqirn Sandbag, Imp Wing,
                -- Rotten Quiver, Bronze Bolt Quiver, Holy Bolt Quiver
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_33 then
            rewards =
            { 
                113, 737, 879, 880, 1523, 1654, 2153, 2163, 4196, 4227, 4228, 4229, 5335, 5336, 5337, 
                5338, 5339, 12823, 12824, 12856, 12864 
                -- Cleaning Tool Set, Gold Ore, Karakul Leather, Bone Chip, Apple Mint, Igneous Rock, Qiqirn Sandbag,
                -- Imp Wing, Rotten Quiver, Bronze Bolt Quiver, Mythril Bolt Quiver, Darksteel Bolt Quiver, 
                -- Acid Bolt Quiver, Holy Bolt Quiver, Sleep Bolt Quiver, Venom Bolt Quiver, Bloody Bolt Quiver,
                -- Bronze Bolt Quiver, Bronze Subligar+1, Leather Trousers, Slops, Slacks
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_34 then
            rewards =
            { 
                113, 879, 880, 1523, 1654, 2153, 2163, 4196, 4227 
                -- Cleaning Tool Set, Karakul Leather, Bone Chip, Apple Mint, Igneous Rock, Qiqirn Sandbag,
                -- Imp Wing, Rotten Quiver, Bronze Bolt Quiver
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_35 then
            rewards =
            { 
                113, 880, 1523, 1654, 2153, 2163, 4196, 4227, 5335 
                -- Cleaning Tool Set, Bone Chip, Apple Mint, Igneous Rock, Qiqirn Sandbag, Imp Wing,
                -- Rotten Quiver, Bronze Bolt Quiver, Acid Bolt Quiver
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_36 then
            rewards =
            { 
                113, 1523, 1654, 2153, 2163, 4196 
                -- Cleaning Tool Set, Apple Mint, Igneous Rock, Qiqirn Sandbag, Imp Wing, Rotten Quiver
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_37 then
            rewards =
            { 
                113, 880, 1523, 1654, 2153, 2163, 4196, 4227, 5334, 5338 
                -- Cleaning Tool Set, Bone Chip, Apple Mint, Igneous Rock, Qiqirn Sandbag, Imp Wing, Rotten Quiver
                -- Bronze Bolt Quiver, Blind Bolt Quiver, Venom Bolt Quiver
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_38 then
            rewards =
            { 
                879, 1523, 1654, 2153, 2163, 4227, 4228, 5334, 5339 
                -- Karakul Leather, Apple Mint, Igneous Rock, Qiqirn Sandbag, Imp Wing, Bronze Bolt Quiver,
                -- Mythril Bolt Quiver, Blind Bolt Quiver, Bloody Bolt Quiver
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_39 then
            rewards =
            { 
                880, 1523, 2153, 2288, 2326, 4196, 4223, 5335, 5337 
                -- Bone Chip, Apple Mint, Qiqirn Sandbag, Karakul Cloth, Target Market, Rotten Quiver, Scorpion Quiver,
                -- Acid Bolt Quiver, Sleep Bolt Quiver
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_40 then
            rewards =
            { 
                1523, 2153, 2163, 4227, 4228 
                -- Apple Mint, Qiqirn Sandbag, Imp Wing, Bronze Bolt Quiver, Mythril Bolt Quiver
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_41 then
            rewards =
            {
                90, 2165, 2167, 2418, 4129, 4220, 4221, 4222, 4223, 4224, 4225, 4226, 4509, 5018, 5332, 
                5333, 5453, 17391, 17396 
                -- Rusty Bucket, Qutrub Gorget, Lamian Armlet, Aht Urhgan Brass Ingot, Stone Quiver, Bone Quiver,
                -- Beetle Quiver, Horn Quiver, Scorpion Quiver, Demon Quiver, Iron Quiver, Silver Quiver,
                -- Distilled Water, Puppet's Operetta, Kabura Quiver, Sleep Quiver, Istakoz, Willow Fishing Rod, Little Worm
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_42 then
            rewards =
            {
                90, 1523, 2165, 2167, 2418, 4129, 4220, 4221, 4224, 4226, 4902, 5332, 5333, 5453 
                -- Rusty Bucket, Apple Mint, Qutrub Gorget, Lamian Armlet, Aht Urhgan Brass Ingot, Stone Quiver,
                -- Bone Quiver, Beetle Quiver, Demon Quiver, Silver Quiver, Light Spirit Pact, Kabura Quiver,
                -- Sleep Quiver, Istakoz
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_43 then
            rewards =
            {
                90, 2165, 2167, 4129, 4220, 4221, 4226, 4386, 4509, 5333, 17396 
                -- Rusty Bucket, Qutrub Gorget, Lamian Armlet, Stone Quiver, Bone Quiver, Beetle Quiver,
                -- Silver Quiver, King Truffle, Distilled Water, Sleep Quiver, Little Worm
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_44 then
            rewards =
            {
                90, 2165, 2167, 2288, 2418, 4223, 4224, 4509, 5139, 5332, 5453, 5566, 17391 
                -- Rusty Bucket, Qutrub Gorget, Lamian Armlet, Karakul Cloth, Aht Urhgan Brass Ingot, Scorpion Quiver,
                -- Demon Quiver, Distilled Water, Betta, Kabura Quiver, Istakoz, Date, Willow Fishing Rod
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_45 then
            rewards =
            {
                90, 2165, 2167, 4129, 4221, 4223, 4226, 5138, 5453, 17391, 17396 
                -- Rusty Bucket, Qutrub Gorget, Lamian Armlet, Stone Quiver, Beetle Quiver, Scorpion Quiver,
                -- Silver Quiver, Black Ghost, Istakoz, Willow Fishing Rod, Little Worm
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_46 then
            rewards =
            {
                2167, 4222, 4509, 5332, 5453, 17391, 17396 
                -- Lamian Armlet, Horn Quiver, Distilled Water, Kabura Quiver, Istakoz, Willow Fishing Rod, Little Worm
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_47 then
            rewards =
            {
                90, 2165, 2167, 2418, 4509, 5333, 5453, 17391, 17396 
                -- Rusty Bucket, Qutrub Gorget, Lamian Armlet, Aht Urhgan Brass Ingot, Distilled Water, Sleep Quiver,
                -- Istakoz, Willow Fishing Rod, Little Worm
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_48 then
            rewards =
            {
                90, 2165, 2167, 4129, 4220, 4221, 4225, 4509, 5453, 17391, 17396 
                -- Rusty Bucket, Qutrub Gorget, Lamian Armlet, Stone Quiver, Bone Quiver, Beetle Quiver, Iron Quiver,
                -- Distilled Water, Istakoz, Willow Fishing Rod, Little Worm
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_49 then
            rewards =
            {
                90, 2153, 2165, 2167, 4129, 4509, 5453 
                -- Rusty Bucket, Qiqirn Sandbag, Qutrub Gorget, Lamian Armlet, Stone Quiver, Distilled Water, Istakoz
            }
        elseif itemOrigin == dsp.appraisalOrigin.ASSAULT_50 then
            rewards =
            {
                2165, 2167, 2371, 2418, 4224, 4226, 5453 
                -- Qutrub Gorget, Lamian Armlet, Khimaira Horn, Aht Urhgan Brass Ingot, Demon Quiver, Silver Quiver, Istakoz
            }
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_AIATAR then
            if chance <= 10 then
                rewards = { 15367, 15370 } -- Falconer's Hose, Sable Cuisses
            else
                rewards = 
                {
                    90, 640, 769, 928, 1108, 1590, 4129, 4220, 4221, 4222, 4225, 4226, 4509, 5333, 5353, 5359 
                    -- Rusty Bucket, Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Stone Quiver, Bone Quiver, 
                    -- Beetle Quiver, Horn Quiver, Iron Quiver, Silver Quiver, Distilled Water, Sleep Quiver,
                    -- Iron Bullet Pouch, Bronze Bullet Pouch
                }
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_INTULO then
            if chance <= 10 then
                rewards = { 15372 } -- Magic Slacks
            else
                rewards = 
                {
                    90, 640, 769, 928, 1108, 1590, 4129, 4220, 4221, 4222, 4225, 4226, 4509, 5333, 5353, 5359 
                    -- Rusty Bucket, Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Stone Quiver, Bone Quiver, 
                    -- Beetle Quiver, Horn Quiver, Iron Quiver, Silver Quiver, Distilled Water, Sleep Quiver,
                    -- Iron Bullet Pouch, Bronze Bullet Pouch
                }
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_FRIAR_RUSH then
            if chance <= 10 then
                rewards = { 18139 } -- Bomb Core
            else
                rewards = 
                {
                    90, 640, 769, 928, 1108, 1590, 4129, 4220, 4221, 4222, 4225, 4226, 4509, 5333, 5353, 5359 
                    -- Rusty Bucket, Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Stone Quiver, Bone Quiver, 
                    -- Beetle Quiver, Horn Quiver, Iron Quiver, Silver Quiver, Distilled Water, Sleep Quiver,
                    -- Iron Bullet Pouch, Bronze Bullet Pouch
                }
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_SABOTENDER_BAILARIN then
            if chance <= 10 then
                rewards = { 18138 } -- Bailathorn
            else
                rewards = 
                {
                    90, 640, 769, 928, 1108, 1590, 4129, 4220, 4221, 4222, 4225, 4226, 4509, 5333, 5353, 5359 
                    -- Rusty Bucket, Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Stone Quiver, Bone Quiver, 
                    -- Beetle Quiver, Horn Quiver, Iron Quiver, Silver Quiver, Distilled Water, Sleep Quiver,
                    -- Iron Bullet Pouch, Bronze Bullet Pouch
                }
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_ODQAN then
            if chance <= 10 then
                rewards = { 15373 } -- Bravo's Subligar
            else
                rewards = 
                {
                    90, 640, 769, 928, 1108, 1590, 4129, 4220, 4221, 4222, 4225, 4226, 4509, 5333, 5353, 5359 
                    -- Rusty Bucket, Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Stone Quiver, Bone Quiver, 
                    -- Beetle Quiver, Horn Quiver, Iron Quiver, Silver Quiver, Distilled Water, Sleep Quiver,
                    -- Iron Bullet Pouch, Bronze Bullet Pouch
                }
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_UNUT then
            if chance <= 10 then
                rewards = { 14287 } -- Luna Subligar
            else
                rewards = 
                {
                    90, 640, 769, 928, 1108, 1590, 4129, 4220, 4221, 4222, 4225, 4226, 4509, 5333, 5353, 5359 
                    -- Rusty Bucket, Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Stone Quiver, Bone Quiver, 
                    -- Beetle Quiver, Horn Quiver, Iron Quiver, Silver Quiver, Distilled Water, Sleep Quiver,
                    -- Iron Bullet Pouch, Bronze Bullet Pouch
                }
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_STRAY_MARY then
            if chance <= 10 then
                rewards = { 17366 } -- Mary's Horn
            else
                rewards = 
                {
                    90, 640, 769, 928, 1108, 1590, 4129, 4220, 4221, 4222, 4225, 4226, 4509, 5333, 5353, 5359 
                    -- Rusty Bucket, Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Stone Quiver, Bone Quiver, 
                    -- Beetle Quiver, Horn Quiver, Iron Quiver, Silver Quiver, Distilled Water, Sleep Quiver,
                    -- Iron Bullet Pouch, Bronze Bullet Pouch
                }
            end
        elseif itemOrigin == dsp.appraisalOrigin.NYZUL_JADED_JODY then
            if chance <= 10 then
                rewards = { 15613 } -- Jet Seraweels
            else
                rewards = 
                {
                    90, 640, 769, 928, 1108, 1590, 4129, 4220, 4221, 4222, 4225, 4226, 4509, 5333, 5353, 5359 
                    -- Rusty Bucket, Copper Ore, Red Rock, Bomb Ash, Sulfur, Holy Basil, Stone Quiver, Bone Quiver, 
                    -- Beetle Quiver, Horn Quiver, Iron Quiver, Silver Quiver, Distilled Water, Sleep Quiver,
                    -- Iron Bullet Pouch, Bronze Bullet Pouch
                }
            end
        end
    end
    if next(rewards) ~= nil then
        return rewards[math.random(#rewards)]
    else
        return 0
    end
end;

function onTrade(player,npc,trade)
    local gil = trade:getGil()
    if gil == 300 then
        if trade:getItemCount() == 2 then
            local itemId = 0

            if trade:hasItemQty(2190, 1) then           -- ??? Sword        2190
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "sword")
            elseif trade:hasItemQty(2191, 1) then       -- ??? Dagger       2191
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "dagger")
            elseif trade:hasItemQty(2192, 1) then       -- ??? Polearm      2192
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "polearm")
            elseif trade:hasItemQty(2193, 1) then       -- ??? Axe          2193
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "axe")
            elseif trade:hasItemQty(2194, 1) then       -- ??? Bow          2194
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "bow")
            elseif trade:hasItemQty(2195, 1) then       -- ??? Gloves       2195
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "gloves")
            elseif trade:hasItemQty(2196, 1) then       -- ??? Footwear     2196
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "footwear")
            elseif trade:hasItemQty(2276, 1) then       -- ??? Headpiece    2276
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "headpiece")
            elseif trade:hasItemQty(2277, 1) then       -- ??? Earring      2277
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "earring")
            elseif trade:hasItemQty(2278, 1) then       -- ??? Ring         2278
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "ring")
            elseif trade:hasItemQty(2279, 1) then       -- ??? Cape         2279
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "cape")
            elseif trade:hasItemQty(2280, 1) then       -- ??? Sash         2280
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "sash")
            elseif trade:hasItemQty(2281, 1) then       -- ??? Shield       2281
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "shield")
            elseif trade:hasItemQty(2282, 1) then       -- ??? Necklace     2282
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "necklace")
            elseif trade:hasItemQty(2283, 1) then       -- ??? Ingot        2283
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "ingot")
            elseif trade:hasItemQty(2284, 1) then       -- ??? Potion       2284
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "potion")
            elseif trade:hasItemQty(2285, 1) then       -- ??? Cloth        2285
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "cloth")
            elseif trade:hasItemQty(2286, 1) then       -- ??? Box          2286
                itemId = appraiseItem(trade:getItem(1):getAppraisalID(), "box")
            end

            if itemId ~= nil or itemId ~= 0 then
                player:addTreasure(itemId, player)
                player:startEvent(679, 1, itemId)
            end
        end
    end
end; 

function onTrigger(player,npc)
    player:startEvent(678, 300)
end; 

function onEventUpdate(player,csid,option)
    --printf("CSID: %u",csid)
    --printf("RESULT: %u",option)
end;

function onEventFinish(player,csid,option)
    --printf("CSID: %u",csid)
    --printf("RESULT: %u",option)
    if (csid == 679) then
        player:tradeComplete()
    end
end;