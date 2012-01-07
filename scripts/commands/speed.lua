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
	if (not player:hasStatusEffect(EFFECT_QUICKENING)) then
		player:addStatusEffect(EFFECT_QUICKENING,speed,0,0);
	end
end;