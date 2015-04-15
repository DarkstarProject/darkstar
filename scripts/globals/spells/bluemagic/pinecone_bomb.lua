-----------------------------------------
-- Spell: Pinecone Bomb
-- Additional effect: sleep. Duration of effect varies with TP
-- Spell cost: 48 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 2
-- Stat Bonus: STR+1
-- Level: 36
-- Casting Time: 2.5 seconds
-- Recast Time: 26.5 seconds
-- Skillchain property: Liquefaction (can open Scission or Fusion)
-- Combos: None
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- onMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

local resist = duration*applyResistance();
function onSpellCast(caster,target,spell)
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.tpmod = TPMOD_DURATION;
        params.dmgtype = DMGTYPE_PIERCE;
        params.scattr = SC_LIQUEFACTION;
        params.numhits = 1;
        params.multiplier = 2.25;
        params.tp150 = 2.25;
        params.tp300 = 2.25;
        params.azuretp = 2.25;
        params.duppercap = 37;
        params.str_wsc = 0.2;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.2;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

	if (damage > 0 and target:hasStatusEffect(EFFECT_SLEEP_I) == false) then
		local typeEffect = EFFECT_SLEEP_I;
		local tp = player:getTP();
		local getBlueEffectDuration = (tp/100 * 5);
        local pStrAgi = caster:getStat(MOD_STR+MOD_AGI);
        local mStrAgi = target:getStat(MOD_STR+MOD_AGI);
        local dStrAgi = (pStrAgi - mStrAgi);
        local resist = applyResistance(caster,spell,target,dStrAgi,BLUE_SKILL,0);
		target:delStatusEffect(typeEffect);
		target:addStatusEffect(typeEffect,1,0,getBlueEffectDuration);
	end
    return EFFECT_SLEEP_I;
end;