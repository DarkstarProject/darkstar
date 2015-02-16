-----------------------------------------
-- ID: 15328
-- Item: Root Sabots
-- Enchantment: Bind
-- Bind Effect: Adds "Regen"
-- Durration: 2 Mins
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:hasStatusEffect(EFFECT_BIND) == true) then
		target:addStatusEffect(EFFECT_REGEN,2,1,120);
	elseif (target:hasStatusEffect(EFFECT_BIND) == false) then
		target:delStatusEffect(EFFECT_REGEN);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local duration = 120;
	target:delStatusEffect(EFFECT_BIND);
	target:addStatusEffect(EFFECT_BIND,1,0,duration);
end;