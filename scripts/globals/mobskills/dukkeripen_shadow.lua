---------------------------------------------
-- Dukkeripen
-- adds 10 shadows
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

    skill:setMsg(MobBuffMove(mob, dsp.effect.BLINK, 10, 0, 120))
    
    return dsp.effect.BLINK
end
