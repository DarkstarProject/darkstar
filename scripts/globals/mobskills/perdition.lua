---------------------------------------------
-- Perdition
-- Description: Instant K.O.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    skill:setMsg(dsp.msg.basic.FALL_TO_GROUND)
    target:setHP(0)

    return 0
end
