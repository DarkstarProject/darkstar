---------------------------------------------
-- Ark Guardian: Tarutaru
-- Begin Ark Angel TT teleport
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    mob:useMobAbility(mob:getMobMod(dsp.mobMod.TELEPORT_END))
    skill:setMsg(dsp.msg.basic.NONE)
    return 0
end
