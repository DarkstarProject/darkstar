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
    params.tpmod = TPMOD_CRITICAL; params.dmgtype = DMGTYPE_SLASH; params.scattr = SC_GRAVITATION;
	params.numhits = 3;
	params.multiplier = 3.25; params.tp150 = 1.25; params.tp300 = 1.25; params.azuretp = 1.25; params.duppercap = 90;
	params.str_wsc = 0.2; params.dex_wsc = 0.2; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
	
    if(target:hasStatusEffect(EFFECT_PARALYSIS) == false) then		
       target:addStatusEffect(EFFECT_PARALYSIS,25,20,math.random(0,60));
    end

    return damage;
end;


  





