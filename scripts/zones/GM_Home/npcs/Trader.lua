-----------------------------------
-- Area: GM Home
--  NPC: Trader
-- Type: Debug NPC for testing trades.
-----------------------------------
package.loaded["scripts/zones/GM_Home/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/GM_Home/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(4096,1) and trade:getItemCount() == 1) then
        player:startEvent(126);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(127);
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
end;