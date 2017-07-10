-----------------------------------
--
--     EFFECT_AGI_DOWN
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if ((target:getStat(MOD_AGI) - effect:getPower()) < 0) then
        effect:setPower(target:getStat(MOD_AGI));
    end
    target:addMod(MOD_AGI,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    -- the effect restore agility of 1 every 3 ticks.
    local downAGI_effect_size = effect:getPower()
    if (downAGI_effect_size > 0) then
        effect:setPower(downAGI_effect_size - 1)
        target:delMod(MOD_AGI,-1);
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local downAGI_effect_size = effect:getPower()
    if (downAGI_effect_size > 0) then
        target:delMod(MOD_AGI,-downAGI_effect_size);
    end
end;
