-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect) --power=30 initially
	target:addMod(MOD_ACC,-1*effect:getPower());
	target:addMod(MOD_EVA,effect:getPower());
	target:addMod(MOD_ENMITY,effect:getPower());
	target:addMod(MOD_NINJA_TOOL,effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	--tick down the effect and reduce the overall power
	target:delMod(MOD_ACC,-1);
	target:delMod(MOD_EVA,1);
	target:delMod(MOD_ENMITY,1);
	target:delMod(MOD_NINJA_TOOL,1);
	effect:setPower(effect:getPower()-1);
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	--remove the remaining power
	target:delMod(MOD_ACC,-1*effect:getPower());
	target:delMod(MOD_EVA,effect:getPower());
	target:delMod(MOD_ENMITY,effect:getPower());
	target:delMod(MOD_NINJA_TOOL,effect:getPower());
end;