-----------------------------------
--	[Command name]: speed
--	[Author      ]: 
--	[Description ]: 
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,speed)
	player:speed(speed);
end;