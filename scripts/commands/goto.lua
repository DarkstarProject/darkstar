-----------------------------------
--	[Command name]: goto
--	[Author      ]: bluekirby0
--	[Description ]: puts you at target's position
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target)
	pc = GetPlayerByName(target)
	if(pc~=nil) then
		zone = pc:getZone();
		targetX = pc:getXPos();
		targetY = pc:getYPos();
		targetZ = pc:getZPos();
		player:setPos(targetX,targetY,targetZ,0,zone);
	else
		printf("Player named %s not found!",target);
	end
end;

-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
--print("CS : onEventUpdate");
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--print("CS : onEventFinish");
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;
