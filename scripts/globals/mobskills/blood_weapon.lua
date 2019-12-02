---------------------------------------------
-- Blood Weapon
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobBuffMove(mob, tpz.effect.BLOOD_WEAPON, 1, 0, 30)

    skill:setMsg(tpz.msg.basic.USES)

    return tpz.effect.BLOOD_WEAPON
end
