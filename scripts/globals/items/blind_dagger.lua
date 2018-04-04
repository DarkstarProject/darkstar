-----------------------------------------
-- ID: 16454
-- Item: Blind dagger
-- Additional Effect: Blindness
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_DARK,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(dsp.effects.BLINDNESS, 10, 0, 30);
        return SUBEFFECT_BLIND, msgBasic.ADD_EFFECT_STATUS, dsp.effects.BLINDNESS;
    end
end;