-----------------------------------
--	[Command name]: give gil to player
--	[Author      ]: link
--	[Description ]: (@givegil Link 100) will give 100 gill to link
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,quantity)
	local pc = GetPlayerByName(target);
	pc:addGil(quantity);
end;