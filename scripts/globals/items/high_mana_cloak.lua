-----------------------------------------
-- ID: 14492
-- Item: High Mana Cloak
-- Item Effect: Restores 50-75 MP
-----------------------------------------

require("scripts/globals/settings");

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
	local mpHeal = math.random(50,75);

	local dif = target:getMaxMP() - target:getMP();
	if (mpHeal > dif) then
		mpHeal = dif;
	end
	target:addMP(mpHeal);
	target:messageBasic(276,0,mpHeal);
end;