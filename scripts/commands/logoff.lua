-----------------------------------
--	[Command name]: logoff
--	[Author      ]: bluekirby0
--	[Description ]: Forcibly log another character out of the game.
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target)
	pc = GetPlayerByName(target)
	if(pc~=nil) then
		pc:leavegame();
	else
		--printf("Player named %s not found!",target);
		player:PrintToPlayer(string.format("Player named %s not found!",target));
	end
end;
