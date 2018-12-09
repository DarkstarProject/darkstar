---------------------------------------------
-- Restoral
-- Description: Restores HP.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local heal = math.random(900, 1400)
    if mob:getPool() == 243 then
        heal = heal * 2.5
    end
    skill:setMsg(dsp.msg.basic.SELF_HEAL)

    return MobHealMove(mob, heal)
end