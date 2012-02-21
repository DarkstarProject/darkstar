-----------------------------------------
-- Spell: Warp
-- Transports the user to their Home Point
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	target:warp();
	return 0;
end;