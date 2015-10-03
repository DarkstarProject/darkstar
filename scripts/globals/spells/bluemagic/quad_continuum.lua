-----------------------------------------
-- Spell: Quad. Continuum
-- Delivers a fourfold attack. Damage varies with TP. 
-- Spell cost: 91 MP
-- Monster Type: Empty
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 2
-- Stat Bonus: DEX+10, CHR-2, STR+10
-- Level: 85
-- Casting Time: 1.0 seconds
-- Recast Time: 31.75 seconds
-- Skillchain Element(s): Distortion (can open/close Darkness with Gravitation WSs and spells)
-- Combos: Dual Wield
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
        params.dmgtype = DMGTYPE_PIERCE;
        params.numhits = 4;
        params.multiplier = 1.25;
        params.tp150 = 1.50;
        params.tp300 = 1.75;
        params.azuretp = 1.0;
        params.duppercap = 100; -- D upper >=69
        params.str_wsc = 1.50;
        params.dex_wsc = 1.50;
        params.vit_wsc = 1.50;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    

    
    return damage;
end;