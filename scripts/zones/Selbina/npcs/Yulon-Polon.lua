-----------------------------------
-- Area: Selbina
--  NPC: Yulon-Polon
-- Type: Title Change NPC
-- !pos 45.998 -16.273 15.739 248
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.titles.CORDON_BLEU_FISHER , dsp.titles.ECOLOGIST , dsp.titles.LIL_CUPID , dsp.titles.ACE_ANGLER , dsp.titles.GOLD_HOOK , dsp.titles.MYTHRIL_HOOK , dsp.titles.SILVER_HOOK , dsp.titles.COPPER_HOOK ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.titles.SAVIOR_OF_LOVE , dsp.titles.HONORARY_CITIZEN_OF_SELBINA , dsp.titles.THE_LOVE_DOCTOR , dsp.titles.LU_SHANGLIKE_FISHER_KING , dsp.titles.ORCISH_SERJEANT , dsp.titles.BRONZE_QUADAV ,
                dsp.titles.YAGUDO_INITIATE , dsp.titles.MOBLIN_KINSMAN , dsp.titles.TEAM_PLAYER , dsp.titles.DYNAMISVALKURM_INTERLOPER , dsp.titles.DISTURBER_OF_SLUMBER , dsp.titles.INTERRUPTER_OF_DREAMS ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.titles.FODDERCHIEF_FLAYER , dsp.titles.WARCHIEF_WRECKER , dsp.titles.DREAD_DRAGON_SLAYER , dsp.titles.OVERLORD_EXECUTIONER , dsp.titles.DARK_DRAGON_SLAYER ,
                dsp.titles.ADAMANTKING_KILLER , dsp.titles.BLACK_DRAGON_SLAYER , dsp.titles.MANIFEST_MAULER , dsp.titles.BEHEMOTHS_BANE , dsp.titles.ARCHMAGE_ASSASSIN , dsp.titles.HELLSBANE , dsp.titles.GIANT_KILLER ,
                dsp.titles.LICH_BANISHER , dsp.titles.JELLYBANE , dsp.titles.BOGEYDOWNER , dsp.titles.BEAKBENDER , dsp.titles.SKULLCRUSHER , dsp.titles.MORBOLBANE , dsp.titles.GOLIATH_KILLER , dsp.titles.MARYS_GUIDE , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { dsp.titles.SIMURGH_POACHER , dsp.titles.ROC_STAR , dsp.titles.SERKET_BREAKER , dsp.titles.CASSIENOVA , dsp.titles.THE_HORNSPLITTER , dsp.titles.TORTOISE_TORTURER , dsp.titles.MON_CHERRY ,
                dsp.titles.BEHEMOTH_DETHRONER , dsp.titles.THE_VIVISECTOR , dsp.titles.DRAGON_ASHER , dsp.titles.EXPEDITIONARY_TROOPER , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { dsp.titles.ADAMANTKING_USURPER , dsp.titles.OVERLORD_OVERTHROWER , dsp.titles.DEITY_DEBUNKER , dsp.titles.FAFNIR_SLAYER , dsp.titles.ASPIDOCHELONE_SINKER , dsp.titles.NIDHOGG_SLAYER ,
                dsp.titles.MAAT_MASHER , dsp.titles.KIRIN_CAPTIVATOR , dsp.titles.CACTROT_DESACELERADOR , dsp.titles.LIFTER_OF_SHADOWS , dsp.titles.TIAMAT_TROUNCER , dsp.titles.VRTRA_VANQUISHER , dsp.titles.WORLD_SERPENT_SLAYER ,
                dsp.titles.XOLOTL_XTRAPOLATOR , dsp.titles.BOROKA_BELEAGUERER , dsp.titles.OURYU_OVERWHELMER , dsp.titles.VINEGAR_EVAPORATOR , dsp.titles.VIRTUOUS_SAINT , dsp.titles.BYEBYE_TAISAI , dsp.titles.TEMENOS_LIBERATOR ,
                dsp.titles.APOLLYON_RAVAGER , dsp.titles.WYRM_ASTONISHER , dsp.titles.NIGHTMARE_AWAKENER , 0 , 0 , 0 , 0 , 0 }
local title7 = { 0 , 0 , 0 , 0 , 0  , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10001,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid==10001) then
        if (option > 0 and option <29) then
            if (player:delGil(200)) then
                player:setTitle( title2[option] )
            end
        elseif (option > 256 and option <285) then
            if (player:delGil(300)) then
                player:setTitle(  title3[option - 256] )
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