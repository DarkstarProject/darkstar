-----------------------------------
--  
--     EFFECT_LEVEL_RESTRICTION
--     
-----------------------------------

require("scripts/globals/msg");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local level = effect:getPower()
    target:levelRestriction(level);
    target:messageBasic(msgBasic.LEVEL_RESTRICTED,level)
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
    target:levelRestriction(0);
end;
