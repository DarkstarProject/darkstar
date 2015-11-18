-----------------------------------
-- Area:  Sacrarium
-- NPC:   _0s7 (Wooden Gate)
-- @pos 213.375 -3.500 -20.000 28
-----------------------------------


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (npc:getAnimation() == 9) then
		npc:openDoor();	
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;