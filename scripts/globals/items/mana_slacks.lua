-----------------------------------------
-- ID: 15372
-- Item: Mana Slacks
-- Item Effect: Restores 30-45 MP
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
	local mpHeal = math.random(30,45);

	local dif = target:getMaxMP() - target:getMP();
	if (mpHeal > dif) then
		mpHeal = dif;
	end
	target:addMP(mpHeal);
	target:messageBasic(276,0,mpHeal);
end;