-----------------------------------
--  Area: The Eldieme Necropolis
--  NPC:  Cannau
--  Type: Escort NPC
--  @pos 419.838 -56.999 -114.870 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Eldieme_Necropolis/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0033);
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

