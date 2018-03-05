---------------------------------------------
-- Spell: Rending Deluge
-- Spell cost: 118 MP
-- Monster Type: Craklaw
-- Spell Type: Magical (Water)
-- Blue Magic Points: 6
-- Stat Bonus: VIT+6
-- Level: 99
-- Casting Time: 2 seconds
-- Recast Time: 35 seconds
-- Magic Bursts on:
-- Combos: Magic Defense Bonus
-----------------------------------------
require("scripts/globals/bluemagic");
require("scripts/globals/magic");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local multi = 1.0;
    if (caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
        multi = multi + 1.50;
    end
    local params = {};
    params.attribute = MOD_INT;
    params.skillType = BLUE_SKILL;
    params.effect = EFFECT_NONE;
    params.multiplier = multi;
    params.tMultiplier = 3.5;
    params.duppercap = 100;
    params.str_wsc = 0.2;
    params.dex_wsc = 0.0;
    params.vit_wsc = 0.2;
    params.agi_wsc = 0.0;
    params.int_wsc = 0.0;
    params.mnd_wsc = 0.0;
    params.chr_wsc = 0.0;

    local resist = applyResistance(caster, target, spell, params);
    if (resist > 0.0625) then
        target:dispelStatusEffect();
    end

    local damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    return damage;
end;
