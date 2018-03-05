-----------------------------------
-- Area: Metalworks
--   NPC: Baldric
-- Type: Quest Giver
-- @zone 237
-- !pos -50.858 1.777 -31.141
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/quests");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(BASTOK,STARDUST) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(503,1) and trade:getItemCount() == 1) then
            player:startEvent(555);
        end
    end

end;

function onTrigger(player,npc)

    if (player:getQuestStatus(BASTOK,STARDUST) == QUEST_AVAILABLE and player:getFameLevel(BASTOK) >= 2) then
        player:startEvent(554);
    else
        player:startEvent(552);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 554) then
        player:addQuest(BASTOK,STARDUST);
    elseif (csid == 555) then
        player:tradeComplete();
        player:addGil(300);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
        player:completeQuest(BASTOK,STARDUST);
    end
end;

