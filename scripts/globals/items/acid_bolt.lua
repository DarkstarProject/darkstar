-----------------------------------------
-- ID: 18148
-- Item: Acid Bolt
-- Additional Effect: Weakens Defense
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
        target:delStatusEffect(dsp.effects.DEFENSE_BOOST);
        target:addStatusEffect(dsp.effects.DEFENSE_DOWN, 12, 0, 60);
        return SUBEFFECT_DEFENSE_DOWN, msgBasic.ADD_EFFECT_STATUS, dsp.effects.DEFENSE_DOWN;
    end
end;