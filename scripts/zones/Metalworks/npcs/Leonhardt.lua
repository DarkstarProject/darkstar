-----------------------------------
-- Area: Metalworks
--  NPC: Leonhardt
-- Involved in Quest: Too Many Chefs
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getVar("TOO_MANY_CHEFS") == 3) then
        if trade:hasItemQty(2527,1) then -- Trade Red Oven Mitt
            player:tradeComplete();
            player:startEvent(950);
        end
    end
end;


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getVar("TOO_MANY_CHEFS") == 1) then
        player:startEvent(948); -- part 2 Too Many Chefs
    else
        player:startEvent(945); -- standard
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
    if (csid == 948) then
        player:setVar("TOO_MANY_CHEFS",2);
    elseif (csid == 950) then
        player:setVar("TOO_MANY_CHEFS",4);
    end
end;
