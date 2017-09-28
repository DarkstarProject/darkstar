-----------------------------------------
-- Spell: Paralyze II
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Paralyze II value per point is '1' This is a constant set in the table 'merits'
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    if (target:hasStatusEffect(EFFECT_PARALYSIS)) then -- Effect already on, do nothing
        spell:setMsg(75);
    else
        -- Calculate duration.
        local duration = 120;

        if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
            duration = duration * 2;
        end

        local dMND = caster:getStat(MOD_MND) - target:getStat(MOD_MND);

        -- Calculate potency.
        local merits = caster:getMerit(MERIT_PARALYZE_II);
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

        if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
            potency = potency * 2;
            caster:delStatusEffect(EFFECT_SABOTEUR);
        end

        -- printf("Duration : %u",duration);
        -- printf("Potency : %u",potency);
        local params = {};
        params.diff = nil;
        params.attribute = MOD_MND;
        params.skillType = 35;
        params.bonus = merits*2;
        params.effect = EFFECT_PARALYSIS;
        resist = applyResistanceEffect(caster, target, spell, params);

        if (resist >= 0.5) then -- There are no quarter or less hits, if target resists more than .5 spell is resisted completely
            if (target:addStatusEffect(EFFECT_PARALYSIS,potency,0,duration*resist)) then
                spell:setMsg(236);
            else
                -- no effect
                spell:setMsg(75);
            end
        else
            -- resist
            spell:setMsg(85);
        end
    end

    return EFFECT_PARALYSIS;
end;
