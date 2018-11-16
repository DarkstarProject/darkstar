---------------------------------------------
-- Azure Lore
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------
 function onMobSkillCheck(target,mob,skill)
    return 0
end
 function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.AZURE_LORE
    local duration = 45

    MobBuffMove(mob, typeEffect, 1, 0, duration)
    skill:setMsg(dsp.msg.basic.USES)
    return typeEffect
end
