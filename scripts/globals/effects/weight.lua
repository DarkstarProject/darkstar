-----------------------------------
--
-- 	EFFECT_WEIGHT
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getPower()>100) then
        effect:setPower(50);
    end
    target:addMod(MOD_MOVE,-effect:getPower());
    target:addMod(MOD_EVA,-effect:getPower()/5);
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
    target:delMod(MOD_MOVE,-effect:getPower());
    target:delMod(MOD_EVA,-effect:getPower()/5);
end;