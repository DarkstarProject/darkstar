-----------------------------------------
-- Bluemagic: Pinecone Bomb
-- Additional effect: sleep. Duration of
-- effect varies with TP.
-- STR +1
-- Lvl.: 36 MP Cost: 48 Blue Points: 2
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local params = {};
	-- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	params.tpmod = TPMOD_NONE; params.dmgtype = DMGTYPE_PIERCE; params.scattr = SC_LIQUEFACTION;
	params.numhits = 1;
	params.multiplier = 1.5; params.tp150 = 1.0; params.tp300 = 1.0; params.azuretp = 1.0; params.duppercap = 65;
	params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.2; params.int_wsc = 0.0; params.mnd_wsc = 1.0; params.chr_wsc = 0.0;
	damage = BluePhysicalSpell(caster, target, spell, params);
	damage = BlueFinalAdjustments(caster, target, spell, damage, params);

	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,1.0);

	if(damage > 0 and resist > 0.3) then
		local typeEffect = EFFECT_SLEEP_I;
		target:delStatusEffect(typeEffect); 
		target:addStatusEffect(typeEffect,1,0,getBlueEffectDuration(caster,resist,typeEffect));
	end

	return damage;
end;