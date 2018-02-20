-----------------------------------
-- Area: Selbina
--  NPC: Jimaida
-- Involved in Quests: Under the sea
-- !pos -15 -2 -16 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getVar("underTheSeaVar") == 2) then
        player:startEvent(33); -- During quest "Under the sea" - 2nd dialog
    else
        player:startEvent(152); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 33) then
        player:setVar("underTheSeaVar",3);
    end
end;

