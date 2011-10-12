-----------------------------------
--
-- 	EFFECT_DIVINE_SEAL
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/common");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(CURE_POWER,2);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(CURE_POWER,2);
end;


