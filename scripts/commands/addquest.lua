-----------------------------------
--	[Command name]: addquest
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
		target:addQuest(logID,missionID);
	end
end;