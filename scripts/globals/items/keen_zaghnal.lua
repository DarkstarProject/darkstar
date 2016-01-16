-----------------------------------------
--    ID: 18067
--    Equip: Keen Zaghnal
--  Enchantment: Accuracy +3
--    Enchantment will wear off if weapon is unequipped.
--  Effect lasts for 30 minutes
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    if (target:getEquipID(SLOT_MAIN) ~= 18067) then
        target:delStatusEffect(EFFECT_ACCURACY_BOOST,18067);
    end
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_ACCURACY_BOOST,0,0,1800,18067);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ACC, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_ACC, 3);
end;