-----------------------------------------
--  Thunderbolt
--
--  Description: Deals Lightning damage in an area of effect. Additional effect: Stun
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range:
--  Notes:
-----------------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	if caster:hasStatusEffect(EFFECT_UNBRIDLED_LEARNING) then
        return 0;
    else
        return MSGBASIC_STATUS_PREVENTS;
    end
end;

function onSpellCast(caster,target,spell)
   local params = {};
    
	params.multiplier = 8.375; params.tMultiplier = 1.0; params.duppercap = 1000;
	params.str_wsc = 0.0; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.3; params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, DEX_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
	
	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_DEX) - target:getStat(MOD_INT),BLUE_SKILL,1.0);

	if(damage > 0 and resist > 0.125) then
		local typeEffect = EFFECT_STUN;
		target:delStatusEffect(typeEffect);
		target:addStatusEffect(typeEffect,5,0,getBlueEffectDuration(caster,resist,typeEffect));
	end
	
    return damage;
end;