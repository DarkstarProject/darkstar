-----------------------------------
--  Area: Western Adoulin
--  NPC: Noan
--  Type: Standard NPC
--  @zone 256
-- @pos 23 0 -84
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(0x0220);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
end;
