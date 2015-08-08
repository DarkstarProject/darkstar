-----------------------------------
-- Area: Spire of Dem
-- NPC:  Radiant Aureole
-- @pos 0.044 -119.249 -360.028 19
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
	player:startEvent(0x000E)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
printf("onFinish CSID: %u",csid);
printf("onFinish RESULT: %u",option);
	
	if (csid == 0x000E and option == 1) then
		player:setPos(139.974, 19.103, 219.989, 128, 108); 	-- To Konschtat Highlands {R}
	end
	
end;