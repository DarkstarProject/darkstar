---------------------------------------------
-- Benediction
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getMobMod(dsp.mobMod.SCRIPTED_2HOUR) == 1) then
        return 0
    elseif (mob:getHPP() <= mob:getMobMod(dsp.mobMod.PROC_2HOUR)) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    target:eraseAllStatusEffect()

    local maxHeal = target:getMaxHP() - target:getHP()

    target:addHP(maxHeal)
    target:wakeUp()

    skill:setMsg(dsp.msg.basic.SELF_HEAL)

    return maxHeal
end
