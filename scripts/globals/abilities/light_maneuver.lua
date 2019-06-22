-----------------------------------
-- Ability: Light Maneuver
-- Enhances the effect of light attachments. Must have animator equipped.
-- Obtained: Puppetmaster level 1
-- Recast Time: 10 seconds (shared with all maneuvers)
-- Duration: 1 minute
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getWeaponSubSkillType(dsp.slot.RANGED) == 10 and
        not player:hasStatusEffect(dsp.effect.OVERLOAD) and
        player:getPet()) then
        return 0,0
    else
        return 71,0
    end
end

function onUseAbility(player,target,ability)

    local burden = 15
    if (target:getStat(dsp.mod.CHR) < target:getPet():getStat(dsp.mod.CHR)) then
        burden = 20
    end

    local overload = target:addBurden(dsp.magic.ele.LIGHT-1, burden)

    if (overload ~= 0 and
        (player:getMod(dsp.mod.PREVENT_OVERLOAD) > 0 or player:getPet():getMod(dsp.mod.PREVENT_OVERLOAD) > 0) and
        player:delStatusEffectSilent(dsp.effect.WATER_MANEUVER)) then
        overload = 0
    end

    if (overload ~= 0) then
        target:removeAllManeuvers()
        target:addStatusEffect(dsp.effect.OVERLOAD, 0, 0, overload)
    else
        local level
        if (target:getMainJob() == dsp.job.PUP) then
            level = target:getMainLvl()
        else
            level = target:getSubLvl()
        end

        local bonus = 1 + (level/15) + target:getMod(dsp.mod.MANEUVER_BONUS)

        if (target:getActiveManeuvers() == 3) then
            target:removeOldestManeuver()
        end

        target:addStatusEffect(dsp.effect.LIGHT_MANEUVER, bonus, 0, 60)
    end

    return dsp.effect.LIGHT_MANEUVER
end