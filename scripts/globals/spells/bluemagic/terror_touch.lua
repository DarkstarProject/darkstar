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
    params.tpmod = TPMOD_ACC; params.dmgtype = DMGTYPE_H2H; params.scattr = SC_COMPRESSION;
        params.numhits = 1;
        params.multiplier = 1.5; params.tp150 = 1.5; params.tp300 = 1.5; params.azuretp = 1.5; params.duppercap = 41;
        params.str_wsc = 0.0; params.dex_wsc = 0.2; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

if(target:hasStatusEffect(EFFECT_ATTACK_DOWN)) then
	spell:setMsg(75); -- no effect
	    else	
		target:addStatusEffect(EFFECT_ATTACK_DOWN,15,0,20);
		   end

    return damage;
end;
