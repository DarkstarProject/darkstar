-----------------------------------
--
--     Plague
--Plague is a harmful status effect that reduces a character's TP and MP over time.
-- Also, causes Steps to only grant One Finishing Move when Main Job is Dancer.
-- Normal power is 5.
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_REFRESH_DOWN, math.ceil(effect:getPower() / 2));
    target:addMod(MOD_REGAIN_DOWN, effect:getPower()*10);
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
    target:delMod(MOD_REFRESH_DOWN, math.ceil(effect:getPower() / 2));
    target:delMod(MOD_REGAIN_DOWN, effect:getPower()*10);
end;