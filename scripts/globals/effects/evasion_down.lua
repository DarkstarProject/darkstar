-----------------------------------
--
--  EFFECT_EVASION_DOWN
--
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------
function onEffectGain(target,effect)
    if (target:getMod(MOD_EVA) - effect:getPower() < 0) then
        effect:setPower(target:getStat(MOD_EVA));
    end
    target:addMod(MOD_EVA,-effect:getPower());
end

-----------------------------------
-- onEffectTick Action
-----------------------------------
function onEffectTick(target,effect)
    -- Only Feint uses the tick, restore 10 evasion every tick
    local evaDownAmt = effect:getPower();
    if (evaDownAmt > 0) then
        effect:setPower(evaDownAmt - 10);
        target:delMod(MOD_EVA, -10);
    end
end

-----------------------------------
-- onEffectLose Action
-----------------------------------
function onEffectLose(target,effect)
    local evaDownAmt = effect:getPower();
    if (evaDownAmt > 0) then
        target:delMod(MOD_EVA,-effect:getPower());
    end
end
