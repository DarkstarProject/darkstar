-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    --NOTE: The power amount dictates the amount to REDUCE MAX VALUES BY. E.g. Power=75 means 'reduce max hp/mp by 75%'
    target:addMod(MOD_HPP,effect:getPower() * -1);
    target:addMod(MOD_MPP,effect:getPower() * -1);
    -- target:addMod(MOD_WEIGHT,-10); -- TODO
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
    --restore HP and MP to its former state. Remove 100% slow
    target:delMod(MOD_HPP,effect:getPower() * -1);
    target:delMod(MOD_MPP,effect:getPower() * -1);
    -- target:delMod(MOD_SPEED,-10); -- todo
end;