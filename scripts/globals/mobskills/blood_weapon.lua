---------------------------------------------
-- Blood Weapon
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.BLOOD_WEAPON
    local duration = 30
    if skill:getParam() ~= 0 then
        duration = skill:getParam()
    end
    MobBuffMove(mob, typeEffect, 1, 0, duration)

    skill:setMsg(dsp.msg.basic.USES)
    return typeEffect
end
