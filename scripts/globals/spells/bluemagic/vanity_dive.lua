-----------------------------------------
--  Vanity Dive
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
    params.tpmod = TPMOD_DAMAGE; params.dmgtype = DMGTYPE_SLASH; params.scattr = SC_DISTORTION;
	params.numhits = 1;
	params.multiplier = 3.0; params.tp150 = 4.0; params.tp300 = 4.5; params.azuretp = 5.0; params.duppercap = 90;  
	params.str_wsc = 0.0; params.dex_wsc = 0.5; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    return damage;
end;