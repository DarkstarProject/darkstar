-----------------------------------------
-- ID: 16773
-- Item: Cruel Scythe
-- Additional Effect: Impairs evasion
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT.EVASION_DOWN)
        target:addStatusEffect(EFFECT.EVASION_DOWN, 12, 0, 60); -- Retail is actually 12.5% but DSP doesn't have the decimal place
        return SUBEFFECT_EVASION_DOWN, msgBasic.ADD_EFFECT_STATUS, EFFECT.EVASION_DOWN;
    end
end;