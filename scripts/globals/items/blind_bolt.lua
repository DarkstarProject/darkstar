-----------------------------------------
-- ID: 18150
-- Item: Blind Bolt
-- Additional Effect: Blindness
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
    if (target:hasImmunity(64)) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    elseif (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_DARK,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(dsp.effects.BLINDNESS)
        if (not target:hasStatusEffect(dsp.effects.BLINDNESS)) then
            target:addStatusEffect(dsp.effects.BLINDNESS, 10, 0, 30);
        end
        return SUBEFFECT_BLIND, msgBasic.ADD_EFFECT_STATUS, dsp.effects.BLINDNESS;
    end
end;
