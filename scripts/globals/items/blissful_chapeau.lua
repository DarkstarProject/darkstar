-----------------------------------------
-- ID: 16078
-- Item: Blissful Chapeau
-- Item Effect: Restores 30-40 MP
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
	local mpHeal = math.random(30,40);

	local dif = target:getMaxMP() - target:getMP();
	if (mpHeal > dif) then
		mpHeal = dif;
	end
	target:addMP(mpHeal);
	target:messageBasic(276,0,mpHeal);
end;