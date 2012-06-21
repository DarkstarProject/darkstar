-----------------------------------------
-- ID: 4174
-- Item: Vile Elixir
-- Item Effect: Instantly restores 25% of HP and MP
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
	target:addHP((target:getMaxHP()/100)*25);
	target:addMP((target:getMaxMP()/100)*25);
	target:messageBasic(026);
end;