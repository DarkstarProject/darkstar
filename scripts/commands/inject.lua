-----------------------------------
--	[Command name]: inject
--	[Author      ]: 
--	[Description ]: 
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,packet)
	player:injectPacket(packet);
end;