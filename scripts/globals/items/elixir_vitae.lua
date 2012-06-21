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
	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addHP((target:getMaxHP()/100)*3);
	target:addMP((target:getMaxMP()/100)*3);
	target:messageBasic(026);
end;