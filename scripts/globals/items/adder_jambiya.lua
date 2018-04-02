-----------------------------------------
-- ID: 18032
-- Item: Adder Jambiya
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
        target:delStatusEffect(EFFECT.EVASION_BOOST);
        target:addStatusEffect(EFFECT.EVASION_DOWN, 10, 0, 60);
        return SUBEFFECT_EVASION_DOWN, msgBasic.ADD_EFFECT_STATUS, EFFECT.EVASION_DOWN;
    end
end;