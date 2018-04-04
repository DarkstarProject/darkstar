-----------------------------------------
-- Spell: Corrosive Ooze
-- Deals water damage to an enemy. Additional Effect: Attack Down and Defense Down
-- Spell cost: 55 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Water)
-- Blue Magic Points: 4
-- Stat Bonus: HP-10 MP+10
-- Level: 66
-- Casting Time: 5 seconds
-- Recast Time: 30 seconds
-- 
-- Combos: Clear Mind
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
    local multi = 2.125;
    if (caster:hasStatusEffect(dsp.effects.AZURE_LORE)) then
        multi = multi + 0.50;
    end
        params.multiplier = multi;
        params.tMultiplier = 2.0;
        params.duppercap = 69;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.2;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    local params = {};

    params.diff = caster:getStat(MOD_INT) - target:getStat(MOD_INT);

    params.attribute = MOD_INT;

    params.skillType = BLUE_SKILL;

    params.bonus = 1.0;

    local resist = applyResistance(caster, target, spell, params);
    local typeEffectOne = dsp.effects.DEFENSE_DOWN;
    local typeEffectTwo = dsp.effects.ATTACK_DOWN;
    local duration = 60;

    if (damage > 0 and resist > 0.3) then
        target:addStatusEffect(typeEffectOne,5,0,duration);
        target:addStatusEffect(typeEffectTwo,5,0,duration);
    end
    
    return damage;
end;