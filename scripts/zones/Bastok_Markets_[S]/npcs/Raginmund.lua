-----------------------------------
-- Area: Bastok Markets (S)
--  NPC: Raginmund
-- Involved in Quest: Too Many Chefs
-- Standard Info NPC
-- Location L-10
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getVar("TOO_MANY_CHEFS") == 2) then
        player:startEvent(112); -- part 3 Too Many Chefs
    else
        player:startEvent(111); -- standard
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 112) then
        player:setVar("TOO_MANY_CHEFS",3);
    end
end;
