-----------------------------------
--
--      EFFECT_ETUDE
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(effect:getSubPower(), effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	if(effect:getTier() == 2 and effect:getPower() > 0) then
	effects:setpower(effect:setpower(), 1)
	target:delMod(effect:getSubPower(), 1)
	end

end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(effect:getSubPower(), effect:getPower());
end;