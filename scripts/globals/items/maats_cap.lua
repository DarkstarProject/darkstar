-----------------------------------------
-- ID: 15194
-- Item: Maats Cap
-- 
-----------------------------------------

function onItemCheck(target)
	return true;
end;

function onItemUse(target)
	target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_MAAT,0,1);
end;
