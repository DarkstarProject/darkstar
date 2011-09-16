-----------------------------------------
--	ID: 14430
--	Equip: Federation Aketon
--  In Windurst: Movement speed +12%
--	Movement Speed bonus does not work in Windurst Waters (S) 
--  Movement Speed bonus works only if Windurst is your current allegiance
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	if (target:getNation() == 2) then 
	
		body = target:getEquipID(5);
		zone = target:getZone();

		if (zone >= 238 and zone <= 242) then
			if (body ~= 14430) then
				target:delMod(MOD_MOVE,12);
			elseif (prevzone < 238 or prevzone > 242) then
				target:addMod(MOD_MOVE,12);
			end
		elseif (prevzone >= 238 and prevzone <= 242) then
			target:delMod(MOD_MOVE,12);
		end
	end
end;