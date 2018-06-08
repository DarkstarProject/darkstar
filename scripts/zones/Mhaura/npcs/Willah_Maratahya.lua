-----------------------------------
-- Area: Mhaura
--  NPC: Willah Maratahya
-- Title Change NPC
-- !pos 23 -8 63 249
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.title.PURVEYOR_IN_TRAINING , dsp.title.ONESTAR_PURVEYOR , dsp.title.TWOSTAR_PURVEYOR , dsp.title.THREESTAR_PURVEYOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.title.FOURSTAR_PURVEYOR , dsp.title.FIVESTAR_PURVEYOR , dsp.title.HEIR_OF_THE_GREAT_LIGHTNING , dsp.title.ORCISH_SERJEANT , dsp.title.BRONZE_QUADAV , dsp.title.YAGUDO_INITIATE ,
                dsp.title.MOBLIN_KINSMAN , dsp.title.DYNAMISBUBURIMU_INTERLOPER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.title.FODDERCHIEF_FLAYER , dsp.title.WARCHIEF_WRECKER , dsp.title.DREAD_DRAGON_SLAYER , dsp.title.OVERLORD_EXECUTIONER , dsp.title.DARK_DRAGON_SLAYER ,
                dsp.title.ADAMANTKING_KILLER , dsp.title.BLACK_DRAGON_SLAYER , dsp.title.MANIFEST_MAULER , dsp.title.BEHEMOTHS_BANE , dsp.title.ARCHMAGE_ASSASSIN , dsp.title.HELLSBANE , dsp.title.GIANT_KILLER ,
                dsp.title.LICH_BANISHER , dsp.title.JELLYBANE , dsp.title.BOGEYDOWNER , dsp.title.BEAKBENDER , dsp.title.SKULLCRUSHER , dsp.title.MORBOLBANE , dsp.title.GOLIATH_KILLER , dsp.title.MARYS_GUIDE , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { dsp.title.SIMURGH_POACHER , dsp.title.ROC_STAR , dsp.title.SERKET_BREAKER , dsp.title.CASSIENOVA , dsp.title.THE_HORNSPLITTER , dsp.title.TORTOISE_TORTURER , dsp.title.MON_CHERRY ,
                dsp.title.BEHEMOTH_DETHRONER , dsp.title.THE_VIVISECTOR , dsp.title.DRAGON_ASHER , dsp.title.EXPEDITIONARY_TROOPER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { dsp.title.ADAMANTKING_USURPER , dsp.title.OVERLORD_OVERTHROWER , dsp.title.DEITY_DEBUNKER , dsp.title.FAFNIR_SLAYER , dsp.title.ASPIDOCHELONE_SINKER , dsp.title.NIDHOGG_SLAYER ,
                dsp.title.MAAT_MASHER , dsp.title.KIRIN_CAPTIVATOR , dsp.title.CACTROT_DESACELERADOR , dsp.title.LIFTER_OF_SHADOWS , dsp.title.TIAMAT_TROUNCER , dsp.title.VRTRA_VANQUISHER , dsp.title.WORLD_SERPENT_SLAYER ,
                dsp.title.XOLOTL_XTRAPOLATOR , dsp.title.BOROKA_BELEAGUERER , dsp.title.OURYU_OVERWHELMER , dsp.title.VINEGAR_EVAPORATOR , dsp.title.VIRTUOUS_SAINT , dsp.title.BYEBYE_TAISAI , dsp.title.TEMENOS_LIBERATOR ,
                dsp.title.APOLLYON_RAVAGER , dsp.title.WYRM_ASTONISHER , dsp.title.NIGHTMARE_AWAKENER , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10001,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid==10001) then
        if (option > 0 and option <29) then
            if (player:delGil(200)) then
                player:setTitle( title2[option] )
            end
        elseif (option > 256 and option <285) then
            if (player:delGil(300)) then
                player:setTitle( title3[option - 256] )
            end
        elseif (option > 512 and option < 541) then
            if (player:delGil(400)) then
                player:setTitle( title4[option - 512] )
            end
        elseif (option > 768 and option <797) then
            if (player:delGil(500)) then
                player:setTitle( title5[option - 768] )
            end
        elseif (option > 1024 and option < 1053) then
            if (player:delGil(600)) then
                player:setTitle( title6[option - 1024] )
            end
        end
    end
end;