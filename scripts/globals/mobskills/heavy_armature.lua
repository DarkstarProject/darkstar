---------------------------------------------------
-- Heavy Armature
-- Adds buffs Haste, Shell, Protect, Blink
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    -- Not much info on how much haste this gives. Supposed to be "high". Went with Magic Haste Cap
    MobBuffMove(mob, dsp.effect.HASTE, 4375, 0, 180)
    MobBuffMove(mob, dsp.effect.PROTECT, 100, 0, 180)
    skill:setMsg(MobBuffMove(mob, dsp.effect.BLINK, math.random(10, 25), 0, 120))

    return dsp.effect.BLINK
end
