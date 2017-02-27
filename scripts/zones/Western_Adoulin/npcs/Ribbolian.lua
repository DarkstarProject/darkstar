-----------------------------------
--  Area: Western Adoulin
--  NPC: Ribbolian
--  Type: Standard NPC
--  @zone 256
-- @pos 21 1 -27
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
    player:startEvent(0x0206);
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
