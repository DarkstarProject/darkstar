-----------------------------------------
-- Spell: Uptala
-- Trust Magic: Uptala
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_UPTALA);

	return 0;
end;