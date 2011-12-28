-----------------------------------------
--	
--	Spell: FireSpirit
--	Summons FireSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_FIRE_SPIRIT);
	return 0;
end;