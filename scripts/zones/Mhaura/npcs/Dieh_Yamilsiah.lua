-----------------------------------
-- Area: Mhaura
-- NPC:  Dieh Yamilsiah
-- Reports the time remaining before boat arrival.
-- @pos 7.057 -2.364 2.489 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
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