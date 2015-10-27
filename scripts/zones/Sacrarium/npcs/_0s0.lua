-----------------------------------
-- Area:  Sacrarium
-- NPC:   _0s0 (Iron Gate)
-- @pos -35.026 -3.000 -9.997 28
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