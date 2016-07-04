-----------------------------------
-- Area: Port Bastok
-- NPC: Styi Palneh
-- Title Change NPC
-- @pos 28 4 -15 236
-----------------------------------

require("scripts/globals/titles");

local title2 = { NEW_ADVENTURER , BASTOK_WELCOMING_COMMITTEE , BUCKET_FISHER , PURSUER_OF_THE_PAST , MOMMYS_HELPER , HOT_DOG ,
                STAMPEDER , RINGBEARER , ZERUHN_SWEEPER , TEARJERKER , CRAB_CRUSHER , BRYGIDAPPROVED , GUSTABERG_TOURIST , MOGS_MASTER , CERULEAN_SOLDIER ,
                DISCERNING_INDIVIDUAL , VERY_DISCERNING_INDIVIDUAL , EXTREMELY_DISCERNING_INDIVIDUAL , APOSTATE_FOR_HIRE , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title3 = { SHELL_OUTER , PURSUER_OF_THE_TRUTH , QIJIS_FRIEND , TREASURE_SCAVENGER , SAND_BLASTER , DRACHENFALL_ASCETIC ,
                ASSASSIN_REJECT , CERTIFIED_ADVENTURER , QIJIS_RIVAL , CONTEST_RIGGER , KULATZ_BRIDGE_COMPANION , AVENGER , AIRSHIP_DENOUNCER ,
                STAR_OF_IFRIT , PURPLE_BELT , MOGS_KIND_MASTER , TRASH_COLLECTOR , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title4 = { BEADEAUX_SURVEYOR , PILGRIM_TO_DEM , BLACK_DEATH , DARK_SIDER , SHADOW_WALKER , SORROW_DROWNER , STEAMING_SHEEP_REGULAR ,
                SHADOW_BANISHER , MOGS_EXCEPTIONALLY_KIND_MASTER , HYPER_ULTRA_SONIC_ADVENTURER , GOBLIN_IN_DISGUISE , BASTOKS_SECOND_BEST_DRESSED ,
                0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title5 = { PARAGON_OF_WARRIOR_EXCELLENCE , PARAGON_OF_MONK_EXCELLENCE , PARAGON_OF_DARK_KNIGHT_EXCELLENCE , HEIR_OF_THE_GREAT_EARTH ,
                MOGS_LOVING_MASTER , HERO_AMONG_HEROES , DYNAMISBASTOK_INTERLOPER , MASTER_OF_MANIPULATION , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
local title6 = { LEGIONNAIRE , DECURION , CENTURION , JUNIOR_MUSKETEER , SENIOR_MUSKETEER , MUSKETEER_COMMANDER , GOLD_MUSKETEER ,
                PRAEFECTUS , SENIOR_GOLD_MUSKETEER , PRAEFECTUS_CASTRORUM , ANVIL_ADVOCATE , FORGE_FANATIC , ACCOMPLISHED_BLACKSMITH , ARMORY_OWNER , TRINKET_TURNER ,
                SILVER_SMELTER , ACCOMPLISHED_GOLDSMITH , JEWELRY_STORE_OWNER , FORMULA_FIDDLER , POTION_POTENTATE , ACCOMPLISHED_ALCHEMIST , APOTHECARY_OWNER ,
                0 , 0 , 0 , 0 , 0 , 0 }
local title7 = { MOG_HOUSE_HANDYPERSON , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x00C8,npcUtil.genTmask(player,title2),npcUtil.genTmask(player,title3),npcUtil.genTmask(player,title4),npcUtil.genTmask(player,title5),npcUtil.genTmask(player,title6),npcUtil.genTmask(player,title7),1   ,player:getGil());
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid==0x00C8) then
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