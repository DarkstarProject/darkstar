------------------------
--      Starlight     --
------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");

function onUseWeaponSkill(player, target, wsID)
    local lvl = player:getSkillLevel(11); --get club skill
    local damage = (lvl-10)/9;
    local damagemod = damage * (player:getTP()/100);
    damagemod = damagemod * WEAPON_SKILL_POWER
    return 1, 0, false, damagemod;
end
