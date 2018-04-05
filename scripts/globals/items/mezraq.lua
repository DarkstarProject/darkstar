-----------------------------------------
-- ID: 18110
-- Item: Mezraq
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
        target:delStatusEffect(dsp.effects.EVASION_DOWN)
        target:addStatusEffect(dsp.effects.EVASION_DOWN, 25, 0, 30);
        return SUBEFFECT_EVASION_DOWN, msgBasic.ADD_EFFECT_STATUS, dsp.effects.EVASION_DOWN;
    end
end;