------------------------
--    Moonlight     --
------------------------
require("scripts/globals/weaponskills")
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local lvl = trust:getMaxSkillLevel(trust:getMainLvl(),dsp.job.WHM,11) -- get club skill
    local damage = (lvl/9) - 1
    local damagemod = damage * ((50+(skill:getTP()*0.05))/100)
    return damagemod * WEAPON_SKILL_POWER
end
