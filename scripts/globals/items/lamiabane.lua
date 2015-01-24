-----------------------------------------
--	ID: 18693
--	Equip: Lamiabane
--  	Latent effect: Enhances Magic Atk Bonus +2
--	Enchantment: Adds "Refresh"
--	Durration: 60 Mins
--	Active while in Mamook, Arrapago Reef, or Halvung
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)

zone = target:getZone();

ranged = target:getEquipID(SLOT_RANGED);

	if (ranged == 18693) then
		if (zone == 65 or zone == 54 or zone == 62) then
			target:addMod(MOD_MATT, 2);
		elseif (zone ~= 65 or zone ~= 54 or zone ~= 62) then
			target:delMod(MOD_MATT, 2);
		end
	elseif (ranged ~= 18693 and zone == 65 or zone == 54 or zone == 62) then
		target:delMod(MOD_MATT, 2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	duration = 3600;
		target:delStatusEffect(EFFECT_REFRESH);
		target:addStatusEffect(EFFECT_REFRESH,3,1,duration);
end;