-----------------------------------------
-- Spell: Goddess's Hymnus
-- Grants Reraise.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

		local duration = 120;

		duration = duration * (caster:getMod(MOD_SONG_DURATION_BONUS)/100)

		target:addBardSong(caster,EFFECT_HYMNUS,1,0,duration,caster:getID(), 0, 1);

    return EFFECT_HYMNUS;

--[[ 
	-- I dunno wtf was being attempted here.

	local duration = 120;
 	duration = duration + (duration * (caster:getMod(MOD_SONG_DURATION)/100));
 	duration = duration + (duration * ((caster:getMod(MOD_ALL_SONGS) * 10)/100));
	duration = duration + (duration * ((caster:getMod(MOD_HYMNUS) * 10)/100));
	
    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
    target:delStatusEffect(EFFECT_HYMNUS);
    target:addStatusEffect(EFFECT_HYMNUS,3,0,duration);
    spell:setMsg(230);
	]]--
end;