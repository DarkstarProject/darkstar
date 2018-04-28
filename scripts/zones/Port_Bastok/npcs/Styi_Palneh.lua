-----------------------------------
-- Area: Port Bastok
--  NPC: Styi Palneh
-- Title Change NPC
-- !pos 28 4 -15 236
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.titles.NEW_ADVENTURER , dsp.titles.BASTOK_WELCOMING_COMMITTEE , dsp.titles.BUCKET_FISHER , dsp.titles.PURSUER_OF_THE_PAST , dsp.titles.MOMMYS_HELPER , dsp.titles.HOT_DOG ,
                dsp.titles.STAMPEDER , dsp.titles.RINGBEARER , dsp.titles.ZERUHN_SWEEPER , dsp.titles.TEARJERKER , dsp.titles.CRAB_CRUSHER , dsp.titles.BRYGIDAPPROVED , dsp.titles.GUSTABERG_TOURIST , dsp.titles.MOGS_MASTER , dsp.titles.CERULEAN_SOLDIER ,
                dsp.titles.DISCERNING_INDIVIDUAL , dsp.titles.VERY_DISCERNING_INDIVIDUAL , dsp.titles.EXTREMELY_DISCERNING_INDIVIDUAL , dsp.titles.APOSTATE_FOR_HIRE , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.titles.SHELL_OUTER , dsp.titles.PURSUER_OF_THE_TRUTH , dsp.titles.QIJIS_FRIEND , dsp.titles.TREASURE_SCAVENGER , dsp.titles.SAND_BLASTER , dsp.titles.DRACHENFALL_ASCETIC ,
                dsp.titles.ASSASSIN_REJECT , dsp.titles.CERTIFIED_ADVENTURER , dsp.titles.QIJIS_RIVAL , dsp.titles.CONTEST_RIGGER , dsp.titles.KULATZ_BRIDGE_COMPANION , dsp.titles.AVENGER , dsp.titles.AIRSHIP_DENOUNCER ,
                dsp.titles.STAR_OF_IFRIT , dsp.titles.PURPLE_BELT , dsp.titles.MOGS_KIND_MASTER , dsp.titles.TRASH_COLLECTOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.titles.BEADEAUX_SURVEYOR , dsp.titles.PILGRIM_TO_DEM , dsp.titles.BLACK_DEATH , dsp.titles.DARK_SIDER , dsp.titles.SHADOW_WALKER , dsp.titles.SORROW_DROWNER , dsp.titles.STEAMING_SHEEP_REGULAR ,
                dsp.titles.SHADOW_BANISHER , dsp.titles.MOGS_EXCEPTIONALLY_KIND_MASTER , dsp.titles.HYPER_ULTRA_SONIC_ADVENTURER , dsp.titles.GOBLIN_IN_DISGUISE , dsp.titles.BASTOKS_SECOND_BEST_DRESSED ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { dsp.titles.PARAGON_OF_WARRIOR_EXCELLENCE , dsp.titles.PARAGON_OF_MONK_EXCELLENCE , dsp.titles.PARAGON_OF_DARK_KNIGHT_EXCELLENCE , dsp.titles.HEIR_OF_THE_GREAT_EARTH ,
                dsp.titles.MOGS_LOVING_MASTER , dsp.titles.HERO_AMONG_HEROES , dsp.titles.DYNAMISBASTOK_INTERLOPER , dsp.titles.MASTER_OF_MANIPULATION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { dsp.titles.LEGIONNAIRE , dsp.titles.DECURION , dsp.titles.CENTURION , dsp.titles.JUNIOR_MUSKETEER , dsp.titles.SENIOR_MUSKETEER , dsp.titles.MUSKETEER_COMMANDER , dsp.titles.GOLD_MUSKETEER ,
                dsp.titles.PRAEFECTUS , dsp.titles.SENIOR_GOLD_MUSKETEER , dsp.titles.PRAEFECTUS_CASTRORUM , dsp.titles.ANVIL_ADVOCATE , dsp.titles.FORGE_FANATIC , dsp.titles.ACCOMPLISHED_BLACKSMITH , dsp.titles.ARMORY_OWNER , dsp.titles.TRINKET_TURNER ,
                dsp.titles.SILVER_SMELTER , dsp.titles.ACCOMPLISHED_GOLDSMITH , dsp.titles.JEWELRY_STORE_OWNER , dsp.titles.FORMULA_FIDDLER , dsp.titles.POTION_POTENTATE , dsp.titles.ACCOMPLISHED_ALCHEMIST , dsp.titles.APOTHECARY_OWNER ,
                0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { dsp.titles.MOG_HOUSE_HANDYPERSON , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(200,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid==200) then
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
                player:setTitle( title5[option - 512] )
            end
        elseif (option > 768 and option <797) then
            if (player:delGil(500)) then
                player:setTitle( title5[option - 768] )
            end
        elseif (option > 1024 and option < 1053) then
            if (player:delGil(600)) then
                player:setTitle( title6[option - 1024] )
            end
        elseif (option > 1280 and option < 1309) then
            if (player:delGil(700)) then
                player:setTitle(  title7[option - 1280])
            end
        end
    end
end;