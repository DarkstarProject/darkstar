------------------------
--    Myrkr     -- 
------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");

function onUseWeaponSkill(player, target, wsID)
	local ftpmp = fTP(player:getTP(),0.2,0.4,0.6);
	return 1, 0, false, (ftpmp*player:getMaxMP());
end
