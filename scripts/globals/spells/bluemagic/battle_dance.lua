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
    params.tpmod = TPMOD_DURATION; params.dmgtype = DMGTYPE_SLASH; params.scattr = SC_IMPACTION;
        params.numhits = 1;
        params.multiplier = 2.0; params.tp150 = 2.0; params.tp300 = 2.0; params.azuretp = 2.0; params.duppercap = 17;
        params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
  
if(target:hasStatusEffect(EFFECT_DEX_DOWN)) then
	spell:setMsg(75); -- no effect
	    else	
		target:addStatusEffect(EFFECT_DEX_DOWN,15,0,20);
		   end

    return damage;
end;
