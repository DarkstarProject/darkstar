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
	player:addStatusEffect(EFFECT_QUICKENING,speed,0,0);
end;