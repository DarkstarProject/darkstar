-----------------------------------------
-- ID: 18160
-- Item: Spartan Bullet
-- Additional Effect: Stun
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 50
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 50)
    end
    if (math.random(0,50) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.LIGHTNING,0) <= 0.5) then
        return 0,0,0
    else
        if (not target:hasStatusEffect(dsp.effect.STUN)) then
            target:addStatusEffect(dsp.effect.STUN, 1, 0, 4)
        end
        return dsp.subEffect.STUN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.STUN
    end
end
