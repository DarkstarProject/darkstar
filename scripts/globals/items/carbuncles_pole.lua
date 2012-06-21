-----------------------------------------
-- ID: 18581
-- Item: Carbuncle's Pole
-- Item Effect: Restores 160-220 HP
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
	hpHeal = math.random(160,220);

	dif = target:getMaxHP() - target:getHP();
	if(hpHeal > dif) then
		hpHeal = dif;
	end
	target:addHP(hpHeal);
	target:messageBasic(263,0,hpHeal);
end;