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
    params.tpmod = TPMOD_ATTACK; params.dmgtype = DMGTYPE_BLUNT; params.scattr = SC_INDURATION;
        params.numhits = 1;
        params.multiplier = 1.0; params.tp150 = 1.0; params.tp300 = 1.0; params.azuretp = 1.0; params.duppercap = 133;
        params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.03; params.agi_wsc = 0.0; params.int_wsc = 0.1; params.mnd_wsc = 0.1; params.chr_wsc = 0.1;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
   
    return damage;
	
end;
