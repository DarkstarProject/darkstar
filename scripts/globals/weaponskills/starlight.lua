------------------------
--      Starlight     --
------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");

function OnUseWeaponSkill(player, target, wsID)
	local lvl = player:getSkillLevel(11); --get club skill
	local damage = (lvl-10)/9;
	local damagemod = damage * (player:getTP()/100);
	return 1, 0, false, damagemod;
end
