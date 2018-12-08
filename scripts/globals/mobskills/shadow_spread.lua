---------------------------------------------
---  Shadow Spread
---
---  Description: A dark shroud renders any nearby targets blinded, asleep, and cursed.
---
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
    local typeEffect = 0
    local currentMsg = dsp.msg.basic.NONE
    local msg = dsp.msg.basic.NONE

    msg = MobStatusEffectMove(mob, target, dsp.effect.CURSE_I, 25, 0, 300)

    if (msg == dsp.msg.basic.SKILL_ENFEEB_IS) then
        typeEffect = dsp.effect.CURSE_I
        currentMsg = msg
    end

    msg = MobStatusEffectMove(mob, target, dsp.effect.BLINDNESS, 20, 0, 180)

    if (msg == dsp.msg.basic.SKILL_ENFEEB_IS) then
        typeEffect = dsp.effect.BLINDNESS
        currentMsg = msg
    end

    msg = MobStatusEffectMove(mob, target, dsp.effect.SLEEP_I, 1, 0, 30)

    if (msg == dsp.msg.basic.SKILL_ENFEEB_IS) then
        typeEffect = dsp.effect.SLEEP_I
        currentMsg = msg
    end

    skill:setMsg(currentMsg)

    return typeEffect
end
