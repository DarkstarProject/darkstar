-----------------------------------
--
-- EFFECT_ASSASSINS_CHARGE
--
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
----------------------------------
function onEffectGain(target,effect)
    target:addMod(MOD_QUAD_ATTACK, effect:getPower());
    target:addMod(MOD_TRIPLE_ATTACK, 100);
    if (effect:getSubType() > 0) then
        target:addMod(MOD_CRITHITRATE, effect:getSubPower());
    end
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
    target:delMod(MOD_QUAD_ATTACK, effect:getPower());
    target:delMod(MOD_TRIPLE_ATTACK, 100);
    if (effect:getSubPower() > 0) then -- MOD_AUGMENTS_ASSASSINS_CHARGE
        target:delMod(MOD_CRITHITRATE, effect:getSubPower());
    end
end;