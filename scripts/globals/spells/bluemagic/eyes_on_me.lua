-----------------------------------------
-- Spell: Eyes On Me
-- Deals dark damage to an enemy
-- Spell cost: 112 MP
-- Monster Type: Demons
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 4
-- Stat Bonus: HP-5, MP+15
-- Level: 61
-- Casting Time: 4.5 seconds
-- Recast Time: 29.25 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: Magic Attack Bonus
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
    local multi = 2.625;
    if (caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
        multi = multi + 2.0;
    end
        params.multiplier = multi;
        params.tMultiplier = 1.5;
        params.duppercap = 69;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.2;
    damage = BlueMagicalSpell(caster, target, spell, params, CHR_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    return damage;
end;