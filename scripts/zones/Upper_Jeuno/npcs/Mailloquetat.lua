-----------------------------------
-- Area: Upper Jeuno
--  NPC: Mailloquetat
-- Involved in Quests: Save my Sister
-- @zone 244
-- !pos -31 -1 8
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getFameLevel(JEUNO) >= 4 and player:getVar("saveMySisterVar") == 1) then
        player:startEvent(159); -- For "Save my Sister" quest
    else
        player:startEvent(25); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 159) then
        player:setVar("saveMySisterVar", 2);
    end
end;

