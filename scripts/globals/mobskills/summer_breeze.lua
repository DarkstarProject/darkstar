---------------------------------------------
-- Summer Breeze
--
-- Description: AoE Erase tpz.effect. (If nothing to Erase, it instead gains Regain.)
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
    local erase = mob:eraseStatusEffect()

    if (erase ~= tpz.effect.NONE) then
        skill:setMsg(tpz.msg.basic.SKILL_ERASE)
        return erase
    else
        skill:setMsg(MobBuffMove(mob, tpz.effect.REGAIN, 10, 3, 60))
        return tpz.effect.REGAIN
    end
end
