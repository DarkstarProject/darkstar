-----------------------------------
-- Ability: Dark Maneuver
-- Enhances the effect of dark attachments. Must have animator equipped.
-- Obtained: Puppetmaster level 1
-- Recast Time: 10 seconds (shared with all maneuvers)
-- Duration: 1 minute
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
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

    local burden = 10
    if (target:getMP() < target:getPet():getMP()) then
        burden = 15
    end

    local overload = target:addBurden(dsp.magic.ele.DARK-1, burden)

    if (overload ~= 0 and
        (player:getMod(dsp.mod.PREVENT_OVERLOAD) > 0 or player:getPet():getMod(dsp.mod.PREVENT_OVERLOAD) > 0) and
        player:delStatusEffectSilent(dsp.effect.WATER_MANEUVER)) then
        overload = 0
    end

    if (overload ~= 0) then
        target:removeAllManeuvers()
        target:addStatusEffect(dsp.effect.OVERLOAD, 0, 0, overload)
    else
        if (target:getActiveManeuvers() == 3) then
            target:removeOldestManeuver()
        end

        local dur = player:getPet():getLocalVar("MANEUVER_DURATION")
        target:addStatusEffect(dsp.effect.DARK_MANEUVER, 0, 0, utils.clamp(dur,60,300))

    end

    return dsp.effect.DARK_MANEUVER
end