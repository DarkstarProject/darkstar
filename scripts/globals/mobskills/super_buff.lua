---------------------------------------------
-- Spike Flail
-- Deals extreme damage in a threefold attack to targets behind the user.
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
    target:addStatusEffectEx(dsp.effect.SUPER_BUFF, 0, 50, 0, 30)
    skill:setMsg(dsp.msg.basic.NONE)
    return 0
end
