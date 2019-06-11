---------------------------------------------
-- Familiar
-- pet powers increase.
---------------------------------------------
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    mob:familiar()

    skill:setMsg(dsp.msg.basic.FAMILIAR_MOB)

    return 0
end
