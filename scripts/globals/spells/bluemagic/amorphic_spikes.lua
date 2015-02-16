-----------------------------------------

-- Amorphic Spikes

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
    params.tpmod = TPMOD_ATTACK; params.dmgtype = DMGTYPE_PIERCE; params.scattr = SC_SCISSION;
        params.numhits = 5;
        params.multiplier = 2.4375; params.tp150 = 2.4375; params.tp300 = 2.4375; params.azuretp = 4.4375; params.duppercap = 100;
        params.str_wsc = 0.0; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
   
    return damage;
end;
