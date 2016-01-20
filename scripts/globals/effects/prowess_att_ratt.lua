-----------------------------------
--
-- EFFECT_PROWESS : Increased treasure casket discovery. 
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
-- This might not be % in retail...If not a % just change ATTP to just ATT
    target:addMod(MOD_ATTP, effect:getPower());
    target:addMod(MOD_RATTP, effect:getPower());
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
    target:delMod(MOD_ATTP, effect:getPower());
    target:delMod(MOD_RATTP, effect:getPower());
end;