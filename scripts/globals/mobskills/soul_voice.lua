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
    MobBuffMove(mob, tpz.effect.SOUL_VOICE, 1, 0, 180)

    skill:setMsg(tpz.msg.basic.USES)

    return tpz.effect.SOUL_VOICE
end
