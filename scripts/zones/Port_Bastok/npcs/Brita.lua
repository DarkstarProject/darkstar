-----------------------------------
--  Area: Port Bastok
--   NPC: Brita
--  Type: Standard NPC
-- @zone: 236
--  @pos 58.161 -3.101 -6.695
-----------------------------------

package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x015a, 0, 1);
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

