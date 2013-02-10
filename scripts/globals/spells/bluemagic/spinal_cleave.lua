require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_ACC; params.dmgtype = DMGTYPE_SLASH; params.scattr = SC_SCISSION; params.scattr2 = SC_DETONATION;
        params.numhits = 1;
        params.multiplier = 3.0; params.tp150 = 3.0; params.tp300 = 3.0; params.azuretp = 3.0; params.duppercap = 75;
        params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
   
    return damage;
end;
