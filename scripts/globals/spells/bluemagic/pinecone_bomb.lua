-----------------------------------------
-- Bluemagic: Pinecone Bomb
-- Additional effect: sleep. Duration of effect varies with TP.
-- Monster Type: Plantoids
-- Spell Type: Physical (Piercing)
-- Stat Bonus: STR+1
-- lvl: 36 MP Cost: 48 Blue Points: 2
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- onMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_DURATION; params.dmgtype = DMGTYPE_PIERCE; params.scattr = SC_LIQUEFACTION;
	params.numhits = 1;
	params.multiplier = 2.25; params.tp150 = 2.25; params.tp300 = 2.25; params.azuretp = 2.25; params.duppercap = 37;
	params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.2; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

	if (damage > 0 and target:hasStatusEffect(EFFECT_SLEEP_I) == false) then
		local typeEffect = EFFECT_SLEEP_I;
		local tp = player:getTP();
		local getBlueEffectDuration = (tp/100 * 5); -- Unsure if this is correct, based on shockwave calc for estimation
		target:delStatusEffect(typeEffect);
		target:addStatusEffect(typeEffect,1,0,getBlueEffectDuration);
	end
    return damage;
end;