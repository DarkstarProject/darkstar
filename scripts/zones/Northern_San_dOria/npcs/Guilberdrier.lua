-----------------------------------
--  Area: Northern San d'Oria
--  NPC: Guilberdrier
--  Type: Standard Info NPC
--  Involved in Quest: Flyers for Regine
--  Involved in Quest: Exit the Gambler
--  @zone: 231
--  @pos: -159.082 12.000 253.794
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
	player:startEvent(0x020a);	
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

