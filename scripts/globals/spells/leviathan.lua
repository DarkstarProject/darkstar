-----------------------------------------
-- Spell: Leviathan
-- Summons Leviathan to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	if(caster:getObjType() == TYPE_PC) then
		return avatarMiniFightCheck(caster);
	end
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_LEVIATHAN);

	return 0;
end;