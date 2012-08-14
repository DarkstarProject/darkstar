-----------------------------------------
-- Spell: WaterSpirit
-- Summons WaterSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_WATER_SPIRIT);
	cost = avatarPerpetuation(caster, spell)
	caster:addStatusEffectEx(EFFECT_AVATAR, 0, cost, 3, 0);
	return 0;
end;