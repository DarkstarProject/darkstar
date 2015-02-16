-----------------------------------------
--	ID: 14679
--	Tactical Ring
--  	Casts Regain.
--	Uses: 20
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
	if (target:hasStatusEffect(EFFECT_ENCHANTMENT) == false) then
		target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,180,14679);
	end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	if (target:hasStatusEffect(EFFECT_REGAIN) == false) then
		target:addStatusEffect(EFFECT_REGAIN,3,1,180);
	end
end;