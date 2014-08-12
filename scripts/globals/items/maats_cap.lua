-----------------------------------------
-- ID: 15194
-- Item: Maats Cap
-- 
-----------------------------------------

function onItemCheck(target)
	return true;
end;

function onItemUse(target)
	target:setPos(11, 3, 117, 0, 243);
end;
