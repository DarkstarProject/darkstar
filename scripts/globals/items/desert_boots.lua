-----------------------------------------
--	ID: 14166
--	Equip: Desert Boots 
--  In sandstorms: Movement speed +12%
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)

	if (target:getWeather() == WEATHER_SAND_STORM) then 

		if target:getEquipID(14430) then 
			   target:addMod(MOD_MOVE,12);
			else
			   target:delMod(MOD_MOVE,12);
			end
	end
end;