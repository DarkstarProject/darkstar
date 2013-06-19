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
		--printf("Player named %s not found!",target);
		player:PrintToPlayer(string.format("Player named %s not found!",target));
	end
end;
