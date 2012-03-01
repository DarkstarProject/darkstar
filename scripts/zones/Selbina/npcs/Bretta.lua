-----------------------------------
-- Area: Selbina
-- NPC: Bretta
-- @zone
-- @pos
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
	if (player:getZPos() > -28.750) then
		player:startEvent(0x046d, 1152 - ((os.time() - 1009810584)%1152));
	else
		player:startEvent(0x00de);  
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;