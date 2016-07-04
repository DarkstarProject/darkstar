-----------------------------------
--
--     EFFECT_SUPER_BUFF
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower();
    target:addMod(MOD_ATTP,power);
    target:addMod(MOD_DEFP,power);
    target:addMod(MOD_MATT,power);
    target:addMod(MOD_MEVA,power);
    -- The following only applies to Nidhogg.  If this buff is to be used anywhere else, a check on mob name (NOT ID) would be a good choice
    target:AnimationSub(2);
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
    local power = effect:getPower();
    target:delMod(MOD_ATTP,power);
    target:delMod(MOD_DEFP,power);
    target:delMod(MOD_MATT,power);
    target:delMod(MOD_MEVA,power);
    target:AnimationSub(0);
end;