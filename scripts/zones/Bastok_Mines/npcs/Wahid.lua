-----------------------------------
-- Area: Bastok Mines
--  NPC: Wahid
-- Start & Finishes Quest: The Siren's Tear
-- @zone 234
-- !pos 26.305 -1 -66.403
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    local SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);

    if (SirensTear ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(576,1) and trade:getItemCount() == 1) then
            player:startEvent(82);
        end
    end
end;

function onTrigger(player,npc)
    local SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);

    if (SirensTear == QUEST_AVAILABLE) then
        player:startEvent(81);
    else
        player:startEvent(28);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 81) then
        player:addQuest(BASTOK,THE_SIREN_S_TEAR);
    elseif (csid == 82) then
        player:tradeComplete();
        player:completeQuest(BASTOK,THE_SIREN_S_TEAR);
        player:addFame(BASTOK,120);
        player:addGil(150*GIL_RATE);
        player:messageSpecial(GIL_OBTAINED,150*GIL_RATE);
        player:addTitle(TEARJERKER);
        player:setVar("SirensTear",0);
    end
end;