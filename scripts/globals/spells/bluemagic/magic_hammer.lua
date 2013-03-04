-----------------------------------------
--
--   Magic Hammer
--
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	local multi = 1.0;
	if(caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
		multi = multi + 0.50;
	end
	params.multiplier = multi; params.tMultiplier = 1.0; params.duppercap = 35;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.3; params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, MND_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
	-- TODO: Check if target has mana then add mana to caster
    return damage;
end;

