-----------------------------------------
-- Spell: Paralyze II
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Paralyze II value per point is '1' This is a constant set in the table 'merits'
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local merits = caster:getMerit(MERIT_PARALYZE_II);

    -- Pull base stats
    local dMND = caster:getStat(MOD_MND) - target:getStat(MOD_MND);

    -- Base potency
    local potency = math.floor(dMND / 4) + 20;

    if (potency > 30) then
        potency = 30;
    end

    if (potency < 10) then
        potency = 10;
    end

    if (merits > 1) then
        potency = potency + merits - 1;
    end

    if (caster:hasStatusEffect(dsp.effects.SABOTEUR)) then
        potency = potency * 2;
    end

    local duration = 120;
    local params = {};
    params.diff = nil;
    params.attribute = MOD_MND;
    params.skillType = 35;
    params.bonus = merits*2;
    params.effect = dsp.effects.PARALYSIS;
    duration = duration * applyResistanceEffect(caster, target, spell, params);

    if (duration >= 90) then
        if (caster:hasStatusEffect(dsp.effects.SABOTEUR)) then
            duration = duration * 2;
        end
        caster:delStatusEffect(dsp.effects.SABOTEUR);

        if (target:addStatusEffect(dsp.effects.PARALYSIS,potency,0,duration)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end
    return dsp.effects.PARALYSIS;
end;