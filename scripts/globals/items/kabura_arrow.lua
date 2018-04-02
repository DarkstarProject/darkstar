-----------------------------------------
-- ID: 17325
-- Item: Kabura Arrow
-- Additional Effect: Silence
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 95;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WIND,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(dsp.effects.SILENCE)
        if (not target:hasStatusEffect(dsp.effects.SILENCE)) then
            target:addStatusEffect(dsp.effects.SILENCE, 1, 0, 60);
        end
        return SUBEFFECT_SILENCE, msgBasic.ADD_EFFECT_STATUS, dsp.effects.SILENCE;
    end
end;