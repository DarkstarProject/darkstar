-----------------------------------
--
--     EFFECT_CHR_DOWN
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if ((target:getStat(MOD_CHR) - effect:getPower()) < 0) then
        effect:setPower(target:getStat(MOD_CHR));
    end
    target:addMod(MOD_CHR,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    -- the effect restore charism of 1 every 3 ticks.
    local downCHR_effect_size = effect:getPower()
    if (downCHR_effect_size > 0) then
        effect:setPower(downCHR_effect_size - 1)
        target:delMod(MOD_CHR,-1);
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    downCHR_effect_size = effect:getPower()
    if (downCHR_effect_size > 0) then
        target:delMod(MOD_CHR,-downCHR_effect_size);
    end
end;
