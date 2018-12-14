---------------------------------------------
-- Dukkeripen
-- paralyzes target
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
    local typeEffect = dsp.effect.PARALYSIS
    
    if MobStatusEffectMove(mob, target, typeEffect, 20, 0, 120) then
        skill:setMsg(dsp.msg.basic.SKILL_ENFEEB_IS)
    else
        skill:setMsg(dsp.msg.basic.SKILL_MISS)
    end
    
    return typeEffect
end
