---------------------------------------------
-- Soul Voice
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobBuffMove(mob, dsp.effect.SOUL_VOICE, 1, 0, 180)

    skill:setMsg(dsp.msg.basic.USES)

    return dsp.effect.SOUL_VOICE
end
