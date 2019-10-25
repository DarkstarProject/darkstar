-----------------------------------
-- Ability: Mijin Gakure
-- Sacrifices user's life to deal damage to an enemy.
-- Obtained: Ninja Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)

    local dmg = (player:getHP() * 0.8) + (player:getMainLvl() / 0.5)
    local resist = applyPlayerResistance(player, nil, target, player:getStat(dsp.mod.INT)-target:getStat(dsp.mod.INT), 0, dsp.magic.ele.NONE)

    dmg = dmg * resist

    dmg = utils.stoneskin(target, dmg)
    target:takeDamage(dmg, player, dsp.attackType.SPECIAL, dsp.damageType.ELEMENTAL)

    player:setLocalVar("MijinGakure", 1)
    if (player:getMod(dsp.mod.MIJIN_NAGI) > 0) then
        player:delStatusEffect(dsp.effect.RERAISE)
        player:addStatusEffect(dsp.effect.RERAISE,1,0,3600)
    end
    player:setHP(0)
    return dmg
end
