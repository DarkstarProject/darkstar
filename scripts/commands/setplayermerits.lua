-----------------------------------
--	[Command name]: give merits to player
--	[Author      ]: link
--	[Description ]: (@setplayermerits Link 10) will set links merit points to 10 
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,quantity)
	local pc = GetPlayerByName(target);
	pc:setMerits(quantity);
end;
