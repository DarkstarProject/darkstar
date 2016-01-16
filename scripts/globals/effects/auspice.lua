--------------------------------------
--
-- EFFECT_AUSPICE
--
-- Power: Used for Enspell Effect
-- SubPower: Tracks Subtle Blow Bonus
-- Tier: Used for Enspell Calculation
--
--------------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    --Auspice Reduces TP via adding to your Subtle Blow Mod
    local subtleBlowBonus = 10 + target:getMod(MOD_AUSPICE_EFFECT);
    --printf("AUSPICE: Adding Subtle Blow +%d!", subtleBlowBonus);
    effect:setSubPower(subtleBlowBonus);
    target:addMod(MOD_SUBTLE_BLOW, subtleBlowBonus);    

    --Afflatus Misery Bonuses    
    if (target:hasStatusEffect(EFFECT_AFFLATUS_MISERY)) then
        target:getStatusEffect(EFFECT_AFFLATUS_MISERY):setSubPower(0);
        target:addMod(MOD_ENSPELL,18);
        target:addMod(MOD_ENSPELL_DMG,effect:getPower());
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
    local subtleBlow = effect:getSubPower();
    --printf("AUSPICE: Removing Subtle Blow +%d!", subtleBlow);
    target:delMod(MOD_SUBTLE_BLOW, subtleBlow);
    
    --Clean Up Any Bonuses That From Afflatus Misery Combo
    if (target:hasStatusEffect(EFFECT_AFFLATUS_MISERY)) then
        local accuracyBonus = target:getStatusEffect(EFFECT_AFFLATUS_MISERY):getSubPower();
        --printf("AUSPICE: Removing Accuracy Bonus +%d!", accuracyBonus);
        target:delMod(MOD_ACC, accuracyBonus);
        local accuracyBonus = target:getStatusEffect(EFFECT_AFFLATUS_MISERY):setSubPower(0);
    
        target:setMod(MOD_ENSPELL_DMG,0);
        target:setMod(MOD_ENSPELL,0);
    end
    
end;