-----------------------------------------
-- ID: 18355
-- Item: Hushed Baghnakhs
-- Additional Effect: Silence
-- TODO: Enchantment: Ensilence
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
        target:addStatusEffect(dsp.effects.SILENCE, 5, 0, 30);
        return SUBEFFECT_SILENCE, msgBasic.ADD_EFFECT_STATUS, dsp.effects.SILENCE;
    end
end;

function onItemCheck(target)
end;

function onItemUse(target)
end;