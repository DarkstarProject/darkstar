-----------------------------------
--
--      dsp.effect.CAROL
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

local resistMod = {dsp.mod.FIRERES, dsp.mod.EARTHRES, dsp.mod.WATERRES, dsp.mod.WINDRES, dsp.mod.ICERES, dsp.mod.THUNDERRES, dsp.mod.LIGHTRES, dsp.mod.DARKRES};

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(resistMod[effect:getSubPower()], effect:getPower());
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
    target:delMod(resistMod[effect:getSubPower()], effect:getPower());
end;