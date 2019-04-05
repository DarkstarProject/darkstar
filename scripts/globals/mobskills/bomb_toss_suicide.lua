---------------------------------------------------
-- Bomb Toss - Suicide
-- Throws a bomb at an enemy. Sometimes backfires.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- notorious monsters shouldn't explode, nor dynamis
    if (mob:isMobType(MOBTYPE_NOTORIOUS) or mob:isInDynamis()) then
        return 1
    end
    if (mob:getMainJob() ~= dsp.job.THF and math.random() < 0.2) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
        local BOMB_TOSS_HPP = skill:getHPP() / 100

        local job = mob:getMainJob()
    local power = math.random(12,18)

    -- thfs drop bombs like crazy
    if (job == dsp.job.THF) then
        power = power + 4
    end

    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*power*BOMB_TOSS_HPP,dsp.magic.ele.FIRE,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.FIRE,MOBPARAM_IGNORE_SHADOWS)

    mob:setHP(0)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.FIRE)
    return dmg
end
