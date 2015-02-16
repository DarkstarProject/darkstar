-----------------------------------------
-- Spell: Gold Capriccio
-- Increases Petrification Resistance to 
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
--[[ no, wrong, crashing server! Try again! DO NOT PUSH TO LIVE BRANCH!
	local duration = 120;
	local power = 20;
 	duration = duration + (duration * (caster:getMod(MOD_SONG_DURATION)/100));
 	duration = duration + (duration * ((caster:getMod(MOD_ALL_SONGS) * 10)/100));
	
	power = power + (caster:getMod(MOD_ALL_SONGS) * 4);
	
    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
    target:delStatusEffect(EFFECT_CAPRICCIO);
    target:addStatusEffect(EFFECT_CAPRICCIO,power,0,duration);
    spell:setMsg(230);
    return EFFECT_CAPRICCIO;
]]
end;