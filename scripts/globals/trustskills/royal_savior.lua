---------------------------------------------
-- Royal Savior
-- Grants effect of Protect
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onTrustWeaponSkill(target, trust, skill, action)
	
	trust:PrintToArea("O great kings of the noble line of d'Oraguille, shield me from harm!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());

    local power = 175
    local duration = 300

    local typeEffect = dsp.effect.DEFENSE_BOOST

    MobBuffMove(trust, typeEffect, power, 0, duration)
	skill:setMsg(dsp.msg.basic.SKILL_GAIN_EFFECT)

    return typeEffect
end
