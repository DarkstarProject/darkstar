-----------------------------------
--
--     EFFECT_DEX_DOWN
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if ((target:getStat(MOD_DEX) - effect:getPower()) < 0) then
        effect:setPower(target:getStat(MOD_DEX));
    end
    target:addMod(MOD_DEX,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    -- the effect restore dexterity of 1 every 3 ticks.
    local downDEX_effect_size = effect:getPower()
    if (downDEX_effect_size > 0) then
        effect:setPower(downDEX_effect_size - 1)
        target:delMod(MOD_DEX,-1);
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    downDEX_effect_size = effect:getPower()
    if (downDEX_effect_size > 0) then
        target:delMod(MOD_DEX,-downDEX_effect_size);
    end
end;
