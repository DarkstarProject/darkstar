-----------------------------------
--
-- EFFECT_SPIRIT_SURGE
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    -- The dragoon's MAX HP increases by % of wyvern MaxHP
    target:addMod(MOD_HP,effect:getPower());
    target:updateHealth();
    target:addHP(effect:getPower());

    -- The dragoon gets a Strength boost relative to his level
    target:addMod(MOD_STR,effect:getSubPower());

    -- The dragoon gets a 50 Accuracy boost
    target:addMod(MOD_ACC, 50);

    -- The dragoon gets 25% Haste (256/1024, see http://wiki.bluegartr.com/bg/Job_Ability_Haste for haste calculation)
    target:addMod(MOD_HASTE_ABILITY, 256);
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
    -- The dragoon's MAX HP returns to normal (when the MAXHP boost in onEffectGain() gets implemented)
    target:delMod(MOD_HP,effect:getPower());

    -- The dragoon loses the Strength boost
    target:delMod(MOD_STR,effect:getSubPower());

    -- The dragoon loses the 50 Accuracy boost
    target:delMod(MOD_ACC, 50);

    -- The dragoon loses 25% Haste
    target:delMod(MOD_HASTE_ABILITY, 256);
end;