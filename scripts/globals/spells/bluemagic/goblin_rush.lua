-----------------------------------------
-- Spell: Goblin Rush
-- Delivers a threefold attack. Accuracy varies with TP.
-- Spell cost: 76 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: HP+10 DEX+12 MND-3 DEF+100
-- Level: 81
-- Casting Time: 0.5 seconds
-- Recast Time: 25.5 seconds
-- Skillchain 
-- Combos: Skillchain Bonus
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.tpmod = TPMOD_ACC;
        params.dmgtype = DMGTYPE_BLUNT;
		params.scattr = SC_FUSION;
        params.numhits = 3;
        params.multiplier = 1.25;
        params.tp150 = 1.25;
        params.tp300 = 1.25;
        params.azuretp = 1.875;
        params.duppercap = 100; -- D upper >=69
        params.str_wsc = 1.5;
        params.dex_wsc = 1.5;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

   
    return damage;
end;