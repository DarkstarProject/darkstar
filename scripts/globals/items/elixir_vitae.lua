-----------------------------------------
-- ID: 5355
-- Item: Elixir Vitae
-- Item Effect: Instantly restores 3% of HP and MP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
mHP = target:getMaxHP();
cHP = target:getHP();
mMP = target:getMaxMP();
cMP = target:getMP();


if (mHP == cHP and mMP == cMP) then
	result = 56; -- Does not let player use item if their hp and mp are full
end
	
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addHP((target:getMaxHP()/100)*3);
	target:addMP((target:getMaxMP()/100)*3);
	target:messageBasic(026);
end;