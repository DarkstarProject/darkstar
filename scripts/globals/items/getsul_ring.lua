-----------------------------------------
--	ID: 14681
--	Getsul Ring
--  	Enchantment: Max HP +20%
--	Uses: 20   Duration: 3 Mins
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
	if(target:addStatusEffect(EFFECT_ENCHANTMENT) == false) then
		target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,180,14681);
	end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HPP, 20);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HPP, 20);
end;