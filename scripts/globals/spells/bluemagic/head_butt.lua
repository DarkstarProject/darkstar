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
    params.tpmod = TPMOD_DAMAGE; params.dmgtype = DMGTYPE_BLUNT; params.scattr = SC_IMPACTION;
	params.numhits = 1;
	params.multiplier = 1.75; params.tp150 = 2.125; params.tp300 = 2.25; params.azuretp = 2.375; params.duppercap = 17;
	params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
if(target:hasStatusEffect(EFFECT_STUN)) then
	spell:setMsg(75); -- no effect
	    else	
target:addStatusEffect(EFFECT_STUN,0,0,math.random(1,5));
		   end

    return damage;
end;