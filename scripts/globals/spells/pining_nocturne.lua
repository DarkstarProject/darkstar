-----------------------------------------
-- Spell: Pining Nocturne
-- Decreases enemy's MACC and increases
-- spellcasting time.
-- Substituted with Addle
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
	local power = 20
	local duration = 120;
 	duration = duration + (duration * (caster:getMod(MOD_SONG_DURATION)/100));
 	duration = duration + (duration * ((caster:getMod(MOD_ALL_SONGS) * 10)/100));
	
	power = power + (caster:getMod(MOD_ALL_SONGS) * 4);
	
    -- Temporary solution EFFECT_NOCTURNE not avaliable in core
    target:addStatusEffect(EFFECT_ADDLE,power,0,duration);
    spell:setMsg(230);
    return EFFECT_ADDLE;
end;