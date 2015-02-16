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
   
    params.tpmod = TPMOD_ACC; params.dmgtype = DMGTYPE_H2H; params.scattr = SC_IMPACTION;
	params.numhits = 3;
	params.multiplier = 4.0; params.tp150 = 2.05; params.tp300 = 2.1; params.azuretp = 2.2; params.duppercap = 100; 
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.3;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    return damage;
end;