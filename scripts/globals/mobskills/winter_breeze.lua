---------------------------------------------
-- Winter Breeze
--
-- Description: AoE Dispel (Only removes one effect) and Stun
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local DISPEL = target:dispelStatusEffect()

    MobStatusEffectMove(mob, target, dsp.effect.STUN, 1, 0, 2)

    if (DISPEL == dsp.effect.NONE) then
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(dsp.msg.basic.SKILL_ERASE)
    end

    return DISPEL
end
