------------------------
--    Moonlight     --
------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local lvl = player:getSkillLevel(11) -- get club skill
    local damage = (lvl/9) - 1
    local damagemod = damage * ((50+(tp*0.05))/100)
    damagemod = damagemod * WEAPON_SKILL_POWER
    return 1, 0, false, damagemod
end
