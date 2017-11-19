-----------------------------------
-- Area: Metalworks
--  NPC: Ferghus
-- Starts Quest: Too Many Chefs (1,86)
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");
require("scripts/globals/status");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local TooManyChefs = player:getQuestStatus(BASTOK,TOO_MANY_CHEFS);
    local pFame = player:getFameLevel(BASTOK);

    if (TooManyChefs == QUEST_AVAILABLE and pFame >= 5) then
        player:startEvent(946); -- Start Quest "Too Many Chefs"
    elseif (player:getVar("TOO_MANY_CHEFS") == 4) then -- after trade to Leonhardt
        player:startEvent(947);
    else
        player:startEvent(420); -- Standard
    end
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
    if (csid == 946 and option == 0) then
        player:addQuest(BASTOK,TOO_MANY_CHEFS);
        player:setVar("TOO_MANY_CHEFS",1);
    elseif (csid == 947) then
        player:setVar("TOO_MANY_CHEFS",5);
    end
end;
