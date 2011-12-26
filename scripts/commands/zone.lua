-----------------------------------
--	[Command name]: zone
--	[Author      ]: 
--	[Description ]: 
-----------------------------------

-----------------------------------
-- zone Action
-----------------------------------

function onTrigger(player,zoneID)
	player:setPos(0,0,0,0,zoneID);
end;