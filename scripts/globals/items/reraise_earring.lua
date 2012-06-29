-----------------------------------------
--	ID: 14790
--	Reraise Earring
--  This earring functions in the same way as the spell Reraise.
-----------------------------------------

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
	power = 1;
	duration = 2100;
	
	if(target:hasStatusEffect(EFFECT_RERAISE) ==true)then
		effect = target:getStatusEffect(EFFECT_RERAISE);
		oPower = effect:getPower();
		if(oPower > power) then
			target:messageBasic(283); -- Higher Tiered verson means no effect!
		else
			target:delStatusEffect(EFFECT_RERAISE);
			target:addStatusEffect(EFFECT_RERAISE,power,0,duration);
		end
	else	
		target:addStatusEffect(EFFECT_RERAISE,power,0,duration);
	end
end;
