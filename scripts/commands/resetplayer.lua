-----------------------------------
--	[Command name]: resetplayer Link
--	[Author      ]: link
--	[Description ]: will clear players account session + warp them to jeuno
--
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target)
	player:resetPlayer(target);
end;