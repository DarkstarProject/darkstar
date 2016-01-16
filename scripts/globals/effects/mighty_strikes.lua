-----------------------------------
--
--     EFFECT_MIGHTY_STRIKES
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
target:addMod(MOD_CRITHITRATE,100)
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
target:addMod(MOD_CRITHITRATE,-100)
end;