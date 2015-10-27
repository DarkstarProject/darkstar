-----------------------------------------
-- ID: 16773
-- Item: Cruel Scythe
-- Additional Effect: Impairs evasion
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_EVASION_DOWN)
        target:addStatusEffect(EFFECT_EVASION_DOWN, 12, 0, 60); -- Retail is actually 12.5% but DSP doesn't have the decimal place
        return SUBEFFECT_EVASION_DOWN, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_EVASION_DOWN;
    end
end;