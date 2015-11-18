-----------------------------------
--
-- 	EFFECT_HELIX
-- 	
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)

end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	local dmg = utils.stoneskin(target, effect:getPower());

	if (dmg > 0) then
		target:delHP(dmg);
		target:wakeUp();
	end

	if (effect:getTick() == 3000) then
		effect:setTick(9000);
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)

end;