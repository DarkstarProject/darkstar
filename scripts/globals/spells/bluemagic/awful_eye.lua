-----------------------------------------
-- Spell: Awful Eye
-- Lowers Strength of enemies within a fan-shaped area originating from the caster
-- Spell cost: 32 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Water)
-- Blue Magic Points: 2
-- Stat Bonus: MND+1
-- Level: 46
-- Casting Time: 2.5 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Clear Mind
-----------------------------------------
require("scripts/globals/bluemagic");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    if (target:hasStatusEffect(dsp.effects.STR_DOWN)) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    elseif (target:isFacing(caster)) then
        local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
        local params = {};
        params.diff = nil;
        params.attribute = MOD_INT;
        params.skillType = BLUE_SKILL;
        params.bonus = 0;
        params.effect = nil;
        local resist = applyResistance(caster, target, spell, params);
        if (resist <= 0) then
            spell:setMsg(msgBasic.MAGIC_RESIST);
        else
            spell:setMsg(msgBasic.MAGIC_ERASE);
            target:addStatusEffect(dsp.effects.STR_DOWN,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_ERASABLE); -- target loses STR
        end;
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end;

    return dsp.effects.STR_DOWN;
end;
