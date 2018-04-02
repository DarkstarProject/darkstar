-----------------------------------------
-- ID: 16495
-- Item: Silence Dagger
-- Additional Effect: Silence
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WIND,0) <= 0.5) then
        return 0,0,0;
    else
        if (not target:hasStatusEffect(dsp.effects.SILENCE)) then
            target:addStatusEffect(dsp.effects.SILENCE, 1, 0, 60);
        end
        return SUBEFFECT_SILENCE, msgBasic.ADD_EFFECT_STATUS, dsp.effects.SILENCE;
    end
end;