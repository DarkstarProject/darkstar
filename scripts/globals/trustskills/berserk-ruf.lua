-----------------------------------
-- Berserk-Ruf
-- Attack Boost Skill
-- Skill Level: 15
-- Grants the user an Attack Boost
-- Element: None
-- Modifiers: None
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustSkillCheck(target,trust,skill)
    --trust:messageBasic(dsp.msg.basic.READIES_WS, 0, 41)
    return 0
end

function onTrustWeaponSkill(target,trust,skill)

	trust:PrintToArea("There is no room for contemplation on the battlefield!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());

    local power = 175
    local duration = 300

    local typeEffect = dsp.effect.ATTACK_BOOST

    MobBuffMove(trust, typeEffect, power, 0, duration)
	skill:setMsg(dsp.msg.basic.SKILL_GAIN_EFFECT)

    return typeEffect
end