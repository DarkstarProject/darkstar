-----------------------------------------
-- Spell: Heavy Strike
-- Damage varies with TP.
-- Spell cost: 32 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: STR+10
-- Level: 92
-- Casting Time: 1 seconds
-- Recast Time: 20 seconds
-- Skillchain Element: Fragmentation(Primary)/Transfixion(Secondary)
-- Combos: Double Attack
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
        params.tpmod = TPMOD_DAMAGE;
        params.dmgtype = DMGTYPE_H2H;
        params.scattr = SC_FRAGMENTATION;
        params.numhits = 1;
        params.multiplier = 2.25;
        params.tp150 = 3.50;
        params.tp300 = 4.00;
        params.azuretp = 4.00;
        params.duppercap = 60;
        params.str_wsc = 1.25;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
   
    return damage;
end;