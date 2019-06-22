---------------------------------------------
-- Meikyo Shisui
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobBuffMove(mob, dsp.effect.MEIKYO_SHISUI, 1, 0, 30)

    skill:setMsg(dsp.msg.basic.USES)

    mob:addTP(3000)

    return dsp.effect.MEIKYO_SHISUI
end
