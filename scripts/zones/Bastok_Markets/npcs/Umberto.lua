-----------------------------------
--  Area: Bastok Markets
--   NPC: Umberto
--  Type: Quest NPC
-- Involved in Quest: Too Many Chefs
-- !pos -56.896 -5 -134.267 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getVar("TOO_MANY_CHEFS") == 5) then -- end Quest Too Many Chefs
        player:startEvent(0x01d9);
    else
        player:startEvent(0x019b);
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
    if (csid == 0x01d9) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,5674);
        else
            player:addItem(5674);
            player:messageSpecial(ITEM_OBTAINED,5674);
            player:addFame(BASTOK,30);
            player:setVar("TOO_MANY_CHEFS",0);
            player:completeQuest(BASTOK,TOO_MANY_CHEFS);
        end
    end
end;
