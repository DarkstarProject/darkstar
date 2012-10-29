-----------------------------------
-- Area: Selbina
-- NPC:  Humilitie
-- Reports the time remaining before boat arrival.
-- @pos 17.979 -2.39 -58.800 248
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
	
	-- The boat comes every 1152 seconds.
	timer = 1152 - ((os.time() - 1009810584)%1152);
	player:startEvent(0x00e7,timer);
	
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