-----------------------------------------
-- ID: 18159
-- Item: Demon Arrow
-- Additional Effect: 12% Attack Down
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
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WATER,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(dsp.effects.ATTACK_DOWN)
        if (not target:hasStatusEffect(dsp.effects.ATTACK_DOWN)) then
            target:addStatusEffect(dsp.effects.ATTACK_DOWN, 12, 0, 60);
        end
        return SUBEFFECT_DEFENSE_DOWN, msgBasic.ADD_EFFECT_STATUS, dsp.effects.ATTACK_DOWN;
    end
end;