-----------------------------------------
-- ID: 17116
-- Item: Misery Staff
-- Additional Effect: Curse
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
        target:addStatusEffect(dsp.effects.CURSE_I, 5, 0, 30);
        return SUBEFFECT_CURSE, msgBasic.ADD_EFFECT_STATUS, dsp.effects.CURSE_I;
    end
end;