-----------------------------------------
-- Spell: Herb Pastoral
-- Increases Poison Resistance to 
-- Party Members within target AoE
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local duration = 120;
	local power = 20;

	duration = duration * (caster:getMod(MOD_SONG_DURATION_BONUS)/100)

	target:addBardSong(caster,EFFECT_PASTORAL,power,0,duration,caster:getID(), 0, 1);

	return EFFECT_PASTORAL;
end;