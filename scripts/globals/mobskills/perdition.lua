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
    if target:hasStatusEffect(dsp.effect.MAGIC_SHIELD) or math.random(0,99) < target:getMod(dsp.mod.DEATHRES) then
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT)
        return 0
    end

    skill:setMsg(dsp.msg.basic.FALL_TO_GROUND)
    target:setHP(0)

    return 0
end
