-----------------------------------------
-- ID: 5254
-- Item: Hyper-Potion
-- Item Effect: Restores 250 hP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
mHP = target:getMaxHP();
cHP = target:getHP();

if (mHP == cHP) then
	result = 56; -- Does not let player use item if their hp is full
	
elseif (target:hasStatusEffect(EFFECT_MEDICINE) == true) then
	result = 111;
end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	mHP = target:getMaxHP();
	cHP = target:getHP();
		
	dif = mHP - cHP;
	if(dif > 250) then
		heal = 250;
	else
		heal = dif;
	end
	
	target:addHP(heal*ITEM_POWER);
	target:messageBasic(24,0,heal);
	target:addStatusEffect(EFFECT_MEDICINE,0,0,300);
end;
