-----------------------------------
--	[Command name]: goto
--	[Author      ]: bluekirby0
--	[Description ]: puts you at target's position
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target)
	local pc = GetPlayerByName(target)
	if(pc~=nil) then
		zone = pc:getZone();
		targetX = pc:getXPos();
		targetY = pc:getYPos();
		targetZ = pc:getZPos();
		player:setPos(targetX,targetY,targetZ,0,zone);
	else
		--printf("Player named %s not found!",target);
		player:PrintToPlayer(string.format("Player named %s not found!",target));
	end
end;
