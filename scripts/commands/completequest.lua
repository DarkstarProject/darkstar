-----------------------------------
--	[Command name]: completequest
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
	if(missionID ~= nil and logID) then
		target:completeQuest(logID,missionID);
	end
end;