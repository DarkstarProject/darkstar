-----------------------------------
--	[Command name]: injectaction
--	[Author      ]: 
--	[Description ]: Injects an action packet with the specified action and animation id.
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,action,anim)
	player:injectActionPacket(action,anim);
end;