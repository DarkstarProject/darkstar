-----------------------------------------
--	ID: 10596
--	Item: Decennial Hose +1
--	Effect: Enchantment Invisible, Sneak, & Deodorize
--	Durration: 3 Mins
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local duration = 180;
	local duration2 = 180;
	if (target:getEquipID(SLOT_BACK) == 13692) then -- Skulker's Cape
		duration = duration * 1.5;
		duration2 = duration2 * 1.5;
	end
	if (target:getEquipID(SLOT_FEET) == 15753) then -- Dream Boots +1
		duration2 = duration2 * 1.5;
	end
	if (target:getEquipID(SLOT_HANDS) == 15753) then -- Dream Mittens +1
			duration2 = duration2 * 1.5;
	end
	if (not target:hasStatusEffect(EFFECT_INVISIBLE)) then
		target:addStatusEffect(EFFECT_INVISIBLE,0,10,duration);
	end
	if (not target:hasStatusEffect(EFFECT_SNEAK)) then
		target:addStatusEffect(EFFECT_SNEAK,1,10,duration2);
	end
	if (not target:hasStatusEffect(EFFECT_DEODORIZE)) then
		target:addStatusEffect(EFFECT_DEODORIZE,1,10,180);
	end
end;
