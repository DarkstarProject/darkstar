-----------------------------------
--
-- Magic Shield BLOCKS all magic attacks
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getPower() == 3) then -- arcane stomp
        target:addMod(dsp.mod.FIRE_ABSORB, 100);
        target:addMod(dsp.mod.EARTH_ABSORB, 100);
        target:addMod(dsp.mod.WATER_ABSORB, 100);
        target:addMod(dsp.mod.WIND_ABSORB, 100);
        target:addMod(dsp.mod.ICE_ABSORB, 100);
        target:addMod(dsp.mod.LTNG_ABSORB, 100);
        target:addMod(dsp.mod.LIGHT_ABSORB, 100);
        target:addMod(dsp.mod.DARK_ABSORB, 100);
    elseif (effect:getPower() < 2) then
        target:addMod(dsp.mod.UDMGMAGIC, -101);
    else
        target:addMod(dsp.mod.MAGIC_ABSORB, 100);
    end;
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
    if (effect:getPower() == 3) then -- arcane stomp
        target:delMod(dsp.mod.FIRE_ABSORB, 100);
        target:delMod(dsp.mod.EARTH_ABSORB, 100);
        target:delMod(dsp.mod.WATER_ABSORB, 100);
        target:delMod(dsp.mod.WIND_ABSORB, 100);
        target:delMod(dsp.mod.ICE_ABSORB, 100);
        target:delMod(dsp.mod.LTNG_ABSORB, 100);
        target:delMod(dsp.mod.LIGHT_ABSORB, 100);
        target:delMod(dsp.mod.DARK_ABSORB, 100);
    elseif (effect:getPower() < 2) then
        target:delMod(dsp.mod.UDMGMAGIC, -101);
    else
        target:delMod(dsp.mod.MAGIC_ABSORB, 100);
    end;
end;
