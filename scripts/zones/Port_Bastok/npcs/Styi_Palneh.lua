-----------------------------------
-- Area: Port Bastok
--  NPC: Styi Palneh
-- Title Change NPC
-- !pos 28 4 -15 236
-----------------------------------
require("scripts/globals/titles");

local title2 = { dsp.title.NEW_ADVENTURER , dsp.title.BASTOK_WELCOMING_COMMITTEE , dsp.title.BUCKET_FISHER , dsp.title.PURSUER_OF_THE_PAST , dsp.title.MOMMYS_HELPER , dsp.title.HOT_DOG ,
                dsp.title.STAMPEDER , dsp.title.RINGBEARER , dsp.title.ZERUHN_SWEEPER , dsp.title.TEARJERKER , dsp.title.CRAB_CRUSHER , dsp.title.BRYGIDAPPROVED , dsp.title.GUSTABERG_TOURIST , dsp.title.MOGS_MASTER , dsp.title.CERULEAN_SOLDIER ,
                dsp.title.DISCERNING_INDIVIDUAL , dsp.title.VERY_DISCERNING_INDIVIDUAL , dsp.title.EXTREMELY_DISCERNING_INDIVIDUAL , dsp.title.APOSTATE_FOR_HIRE , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { dsp.title.SHELL_OUTER , dsp.title.PURSUER_OF_THE_TRUTH , dsp.title.QIJIS_FRIEND , dsp.title.TREASURE_SCAVENGER , dsp.title.SAND_BLASTER , dsp.title.DRACHENFALL_ASCETIC ,
                dsp.title.ASSASSIN_REJECT , dsp.title.CERTIFIED_ADVENTURER , dsp.title.QIJIS_RIVAL , dsp.title.CONTEST_RIGGER , dsp.title.KULATZ_BRIDGE_COMPANION , dsp.title.AVENGER , dsp.title.AIRSHIP_DENOUNCER ,
                dsp.title.STAR_OF_IFRIT , dsp.title.PURPLE_BELT , dsp.title.MOGS_KIND_MASTER , dsp.title.TRASH_COLLECTOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { dsp.title.BEADEAUX_SURVEYOR , dsp.title.PILGRIM_TO_DEM , dsp.title.BLACK_DEATH , dsp.title.DARK_SIDER , dsp.title.SHADOW_WALKER , dsp.title.SORROW_DROWNER , dsp.title.STEAMING_SHEEP_REGULAR ,
                dsp.title.SHADOW_BANISHER , dsp.title.MOGS_EXCEPTIONALLY_KIND_MASTER , dsp.title.HYPER_ULTRA_SONIC_ADVENTURER , dsp.title.GOBLIN_IN_DISGUISE , dsp.title.BASTOKS_SECOND_BEST_DRESSED ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { dsp.title.PARAGON_OF_WARRIOR_EXCELLENCE , dsp.title.PARAGON_OF_MONK_EXCELLENCE , dsp.title.PARAGON_OF_DARK_KNIGHT_EXCELLENCE , dsp.title.HEIR_OF_THE_GREAT_EARTH ,
                dsp.title.MOGS_LOVING_MASTER , dsp.title.HERO_AMONG_HEROES , dsp.title.DYNAMISBASTOK_INTERLOPER , dsp.title.MASTER_OF_MANIPULATION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { dsp.title.LEGIONNAIRE , dsp.title.DECURION , dsp.title.CENTURION , dsp.title.JUNIOR_MUSKETEER , dsp.title.SENIOR_MUSKETEER , dsp.title.MUSKETEER_COMMANDER , dsp.title.GOLD_MUSKETEER ,
                dsp.title.PRAEFECTUS , dsp.title.SENIOR_GOLD_MUSKETEER , dsp.title.PRAEFECTUS_CASTRORUM , dsp.title.ANVIL_ADVOCATE , dsp.title.FORGE_FANATIC , dsp.title.ACCOMPLISHED_BLACKSMITH , dsp.title.ARMORY_OWNER , dsp.title.TRINKET_TURNER ,
                dsp.title.SILVER_SMELTER , dsp.title.ACCOMPLISHED_GOLDSMITH , dsp.title.JEWELRY_STORE_OWNER , dsp.title.FORMULA_FIDDLER , dsp.title.POTION_POTENTATE , dsp.title.ACCOMPLISHED_ALCHEMIST , dsp.title.APOTHECARY_OWNER ,
                0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { dsp.title.MOG_HOUSE_HANDYPERSON , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(200,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
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