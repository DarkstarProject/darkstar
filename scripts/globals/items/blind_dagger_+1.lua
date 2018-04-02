-----------------------------------------
-- ID: 16493
-- Item: Blind Dagger +1
-- Additional Effect: Blindness
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 15;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_DARK,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT.BLINDNESS, 10, 0, 30);
        return SUBEFFECT_BLIND, msgBasic.ADD_EFFECT_STATUS, EFFECT.BLINDNESS;
    end
end;