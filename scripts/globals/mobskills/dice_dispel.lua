---------------------------------------------
-- Goblin Dice
--
-- Description: Stun
-- Type: Physical (Blunt)
--
--
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
    local effect = target:dispelStatusEffect()
    local effect2 = target:dispelStatusEffect()
    local effect3 = target:dispelStatusEffect()
    local num = 0

    if (effect ~= dsp.effect.NONE) then
        num = num + 1
    end

    if (effect2 ~= dsp.effect.NONE) then
        num = num + 1
    end

    if (effect3 ~= dsp.effect.NONE) then
        num = num + 1
    end

    if (num == 0) then
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(dsp.msg.basic.DISAPPEAR_NUM)
    end

    return num
end
