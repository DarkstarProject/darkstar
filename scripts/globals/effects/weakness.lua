-----------------------------------
--
-- Weakness
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    --reduce HP and MP by the power amount. Add 100% slow
    --NOTE: The power amount dictates the amount to REDUCE MAX VALUES BY. E.g. Power=75 means 'reduce max hp/mp by 75%'
    target:addMod(MOD_HPP,-75);
    target:addMod(MOD_MPP,-75);

    -- This is wrong, and players should be given a fixed 100% slow in the core so that all haste is ignored, but I am le tired.
    target:addMod(MOD_HASTE_MAGIC,-1024);

    if (effect:getPower() == 2) then
        -- handle double weakness
        target:addMod(MOD_RATTP,-100);
        target:addMod(MOD_RACCP,-100);
        target:addMod(MOD_MATT,-999);
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
    --restore HP and MP to its former state. Remove 100% slow
    target:delMod(MOD_HPP,-75);
    target:delMod(MOD_MPP,-75);
    target:delMod(MOD_HASTE_MAGIC,-1024);

    if (effect:getPower() == 2) then
        -- handle double weakness
        target:delMod(MOD_RATTP,-100);
        target:delMod(MOD_RACCP,-100);
        target:delMod(MOD_MATT,-999);
    end
end;