-----------------------------------------
-- ID: 4255
-- Item: Pinch of Mana Powder
-- Item Effect: Restores 25% MP AoE 10' radius
-----------------------------------------

-- TODO: Make AoE

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	mMP = target:getMaxMP();
	cMP = target:getMP();
	rMP = mMP * .25;
	if (mMP == cMP) then
		result = 56; -- Does not let player use item if their mp is full
	end
	if (target:hasStatusEffect(EFFECT_MEDICINE)) then
		result = 111;
	end	
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_MEDICINE,0,0,180);
	target:messageBasic(25,0,target:addMP(rMP));
end;
