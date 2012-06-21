-----------------------------------------
-- ID: 4175
-- Item: Vile Elixir +1
-- Item Effect: Instantly restores 55% of HP and MP
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
	target:addHP((target:getMaxHP()/100)*55);
	target:addMP((target:getMaxMP()/100)*55);
	target:messageBasic(026);
end;