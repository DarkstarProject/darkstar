-----------------------------------
--
--      EFFECT_CAROL
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

local resistMod = {MOD_FIRERES, MOD_EARTHRES, MOD_WATERRES, MOD_WINDRES, MOD_ICERES, MOD_THUNDERRES, MOD_LIGHTRES, MOD_DARKRES};

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