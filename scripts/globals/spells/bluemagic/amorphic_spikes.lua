-----------------------------------------
-- Spell: Amorphic Spikes
-- Delivers a fivefold attack. Damage varies with TP.
-- Spell cost: 79 MP
-- Monster Type: Amorphs
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 2
-- Stat Bonus: INT+15, MND+2
-- Level: 98
-- Casting Time: 0.5 seconds
-- Recast Time: 58.25 seconds
-- Skillchain Element(s): Gravitation (can open/close Darkness with Distortion WSs and spells)
-- Combos: Gilfinder
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
        params.dmgtype = DMGTYPE_PIERCE;
        params.scattr = SC_GRAVITATION;
        params.numhits = 5;
        params.multiplier = 1.5;
        params.tp150 = 1.75;
        params.tp300 = 1.85;
        params.azuretp = 1.9;
        params.duppercap = 100; 
        params.str_wsc = 0.0;
        params.dex_wsc = 1.2;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.2;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    return damage;
end;