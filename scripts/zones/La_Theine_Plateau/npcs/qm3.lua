-----------------------------------
-- Area: La Theine Plateau
--  NPC:??? (qm3)
-- Involved in Quest: I Can Hear A Rainbow
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/La_Theine_Plateau/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(WINDURST, I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1125,1) and trade:getItemCount() == 1 and trade:getGil() == 0 and player:getVar("I_CAN_HEAR_A_RAINBOW") == 127) then
            player:startEvent(124);
        end
    end
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Tenzen_s_Path") == 0) then
        player:startEvent(203);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 124) then
        player:tradeComplete();
        player:completeQuest(WINDURST, I_CAN_HEAR_A_RAINBOW);
        player:addTitle(RAINBOW_WEAVER);
        player:unlockJob(JOBS.SMN);
        player:addSpell(296);
        player:messageSpecial(UNLOCK_SUMMONER);
        player:messageSpecial(UNLOCK_CARBUNCLE);
        player:setVar("ICanHearARainbow",0);
        SetServerVariable("I_Can_Hear_a_Rainbow", 1);
    elseif (csid == 203) then
        player:setVar("COP_Tenzen_s_Path",1);
    end
end;



