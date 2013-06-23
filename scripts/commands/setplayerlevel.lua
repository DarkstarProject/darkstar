-----------------------------------
--	[Command name]: set a players level
--	[Author      ]: link
--	[Description ]: (@setplayerlevel Link 75) will links level to 75
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,level)
	local pc = GetPlayerByName(target);
	pc:setLevel(level);
end;
