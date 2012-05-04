-----------------------------------
--	[Command name]: bring
--	[Author      ]: bluekirby0
--	[Description ]: brings a player to your position
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target)
	pc = GetPlayerByName(target)
	if(pc~=nil) then
		zone = player:getZone();
		targetX = player:getXPos();
		targetY = player:getYPos();
		targetZ = player:getZPos();
		pc:setPos(targetX,targetY,targetZ,0,zone);
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
