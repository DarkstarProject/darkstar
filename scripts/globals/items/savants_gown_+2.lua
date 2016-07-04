-----------------------------------------
--    ID: 11103
--    Equip: savants_gown_+2
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    if (target:getEquipID(SLOT_BODY) == 11103) then
        target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,11103);
    else
        target:delStatusEffect(EFFECT_AUTO_REFRESH,11103);
    end
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    target:addMP(effect:getPower());
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;