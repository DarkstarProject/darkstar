-----------------------------------
--	[Command name]: pos
--	[Author      ]: 
--	[Description ]: 
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,x,y,z,zone)
	
	if(zone == nil) then
		player:setPos(x,y,z,0);
	else
		player:setPos(x,y,z,0,zone);
	end
	
end;