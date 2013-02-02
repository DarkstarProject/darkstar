require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_DAMAGE; params.dmgtype = DMGTYPE_SLASH; params.scattr = SC_COMPRESSION;
	params.numhits = 1;
	params.multiplier = 1.5; params.tp150 = 2.75; params.tp300 = 3.25; params.azuretp = 3.3; params.duppercap = 74; -- >=69 D  
	params.str_wsc = 0.6; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    return damage;
end;