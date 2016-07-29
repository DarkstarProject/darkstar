-----------------------------------
--  Area: Manaclipper
--  NPC:  Gniyah Mischatt
--  Type: Adventurer's Assistant
--  @pos 0.033 -4 2.725 3
-----------------------------------
package.loaded["scripts/zones/Manaclipper/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Manaclipper/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0002);
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

