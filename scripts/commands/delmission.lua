-----------------------------------
--	[Command name]: delmission
--	[Author      ]: 
--	[Description ]: 
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,logID,missionID,victim)
	local target = GetPlayerByName(victim);
	if (target == nil) then
		target = player;
	end
	if(missionID ~= nil and logID ~= nil) then
		target:delMission(logID,missionID);
	end
end;