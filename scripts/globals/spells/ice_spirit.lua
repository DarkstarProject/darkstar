-----------------------------------------
--	
--	Spell: IceSpirit
--	Summons IceSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_ICE_SPIRIT);
	return 0;
end;