---------------------------------------------
-- Dukkeripen
-- Self healing move
-- Type: Magical
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if mob:getMainJob() == dsp.job.COR then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)

    skill:setMsg(dsp.msg.basic.SELF_HEAL)
    
    return MobHealMove(mob, math.random(350,500))
end
