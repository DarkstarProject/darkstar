-----------------------------------
-- Ability: Weapon Bash
-- Delivers an attack that can stun the target.
-- Obtained: Dark Knight Level 20
-- Cast Time: Instant
-- Recast Time: 3:00 minutes
-- Note: This ability requires a two-handed weapon to use
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (not player:isWeaponTwoHanded()) then
        return dsp.msg.basic.NEEDS_2H_WEAPON,0
    else
        return 0,0
    end
end

function onUseAbility(player,target,ability)
    -- Applying Weapon Bash stun. Rate is said to be near 100%, so let's say 99%.
    if (math.random()*100 < 99) then
        target:addStatusEffect(dsp.effect.STUN,1,0,6)
    end

    -- Weapon Bash deals damage dependant of Dark Knight level
    local darkKnightLvl = 0
    if (player:getMainJob() == dsp.job.DRK) then
        darkKnightLvl = player:getMainLvl()    -- Use Mainjob Lvl
    elseif (player:getSubJob() == dsp.job.DRK) then
        darkKnightLvl = player:getSubLvl()    -- Use Subjob Lvl
    end

    -- Calculating and applying Weapon Bash damage
    local damage = math.floor(((darkKnightLvl + 11) / 4) + player:getMod(dsp.mod.WEAPON_BASH))
    target:takeDamage(damage, player, dsp.attackType.PHYSICAL, dsp.damageType.BLUNT)
    target:updateEnmityFromDamage(player,damage)
    return damage
end
