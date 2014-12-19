-----------------------------------------
-- Spiral Spin
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
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_CRITICAL; params.dmgtype = DMGTYPE_SLASH; params.scattr = SC_TRANSFIXION;
	params.numhits = 1;
    params.multiplier = 1.925; params.tp150 = 1.25; params.tp300 = 1.25; params.azuretp = 1.25; params.duppercap = 60;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.30; params.int_wsc = 0.10; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
   
   local chance = math.random();

	if(damage > 0 and chance > 4) then
		local typeEffect = EFFECT_ACCURACY_DOWN;
		target:delStatusEffect(typeEffect);
		target:addStatusEffect(typeEffect,4,0,getBlueEffectDuration(caster,resist,typeEffect));
	end
    return damage;
end;
