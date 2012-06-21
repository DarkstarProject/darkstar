-----------------------------------------
-- ID: 4144
-- Item: Hi-Elixir
-- Item Effect: Instantly restores 50% of HP and MP
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
	target:addHP((target:getMaxHP()/100)*50);
	target:addMP((target:getMaxMP()/100)*50);
	target:messageBasic(026);
end;