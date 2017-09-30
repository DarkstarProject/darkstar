-----------------------------------
--  
--     EFFECT_LEVEL_RESTRICTION
--     
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:levelRestriction(effect:getPower());
    target:messageBasic(314, effect:getPower()); -- <target>'s level is restricted to <param>
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