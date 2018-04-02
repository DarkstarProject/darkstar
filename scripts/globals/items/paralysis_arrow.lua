-----------------------------------------
-- ID: 18696
-- Item: Paralysis Arrow
-- Additional Effect: Paralysis (20 power)
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
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(dsp.effects.PARALYSIS)
        if (not target:hasStatusEffect(dsp.effects.PARALYSIS)) then
            target:addStatusEffect(dsp.effects.PARALYSIS, 20, 0, 30);
        end
        return SUBEFFECT_PARALYSIS, msgBasic.ADD_EFFECT_STATUS, dsp.effects.PARALYSIS;
    end
end;