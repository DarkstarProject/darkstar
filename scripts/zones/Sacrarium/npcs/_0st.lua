-----------------------------------
-- Area:  Sacrarium
-- NPC:   _0st (Switch)
-- Notes: Opens _0su (Gate)
-- @pos 103.478 -1.563 50.181 28
-----------------------------------


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getZPos() < 50) then
		npc:openDoor();
	else
		player:messageSpecial(CANNOT_OPEN_SIDE);			
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