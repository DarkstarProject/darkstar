---------------------------------------------
-- Tortoise Song
--
-- Description: Removes all status effects in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 20' radial
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local count = target:dispelAllStatusEffect(bit.bor(dsp.effectFlag.SONG, dsp.effectFlag.ROLL))

    if (count == 0) then
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT)
    else
        skill:setMsg(dsp.msg.basic.DISAPPEAR_NUM)
    end

    return count
end
