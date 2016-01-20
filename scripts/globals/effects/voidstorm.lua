-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR,math.floor(effect:getPower()/2));
    target:addMod(MOD_DEX,math.floor(effect:getPower()/2));
    target:addMod(MOD_VIT,math.floor(effect:getPower()/2));
    target:addMod(MOD_AGI,math.floor(effect:getPower()/2));
    target:addMod(MOD_INT,math.floor(effect:getPower()/2));
    target:addMod(MOD_MND,math.floor(effect:getPower()/2));
    target:addMod(MOD_CHR,math.floor(effect:getPower()/2));
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
    target:delMod(MOD_STR,math.floor(effect:getPower()/2));
    target:delMod(MOD_DEX,math.floor(effect:getPower()/2));
    target:delMod(MOD_VIT,math.floor(effect:getPower()/2));
    target:delMod(MOD_AGI,math.floor(effect:getPower()/2));
    target:delMod(MOD_INT,math.floor(effect:getPower()/2));
    target:delMod(MOD_MND,math.floor(effect:getPower()/2));
    target:delMod(MOD_CHR,math.floor(effect:getPower()/2));
end;