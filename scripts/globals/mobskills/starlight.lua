---------------------------------------------
-- Starlight
--
-- Description: Restores MP. Amount restored varies with TP.
-- Type: None
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(dsp.msg.basic.READIES_WS, 0, 168)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local lvl = mob:getMainLvl() * 3.4
	local tp = skill:getTP()
	local mpRecover = ((lvl * 0.11) * ((tp/1000) + 2))

    mob:addMP(mpRecover)
	
    skill:setMsg(dsp.msg.basic.SKILL_RECOVERS_MP)
    return mpRecover
end