---------------------------------------------
--  Poison Breath
--------------------------------------------- 
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");
---------------------------------------------
function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	local multi = 1.08;
	if(caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
		multi = multi + 0.50;
	end
	params.multiplier = multi; params.tMultiplier = 1.5; params.duppercap = 69;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.3; params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, MND_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,1.0);

	if(damage > 0 and resist > 0.3) then
	local typeEffect = EFFECT_POISON;
		target:delStatusEffect(typeEffect); 
		target:addStatusEffect(typeEffect,3,0,getBlueEffectDuration(caster,resist,typeEffect));
	end
	
	return damage;
end;