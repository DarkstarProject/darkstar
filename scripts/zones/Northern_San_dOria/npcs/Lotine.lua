-----------------------------------
--  Area: Northern San d'Oria
--  NPC: Lotine
--  Type: Standard Info NPC
--  @zone: 231
--  @pos -137.504 11.999 171.090
--
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
	rand = math.random(1,2);
      if (rand == 1) then
         player:startEvent(0x028c);
      else
         player:startEvent(0x0290);
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
end;

