-----------------------------------------
-- Spell: Charged Whisker
-- Deals thunder damage to an enemy.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local params = {};

	local multi = 7.56;
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	params.multiplier = multi; params.tMultiplier = 1.0; params.duppercap = 69;
	params.str_wsc = 0.0; params.dex_wsc = 0.5; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.3; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, DEX_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
	
    return damage;
end;