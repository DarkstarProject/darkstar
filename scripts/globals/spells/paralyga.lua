-----------------------------------------
-- Spell: Paralyze
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
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

    if (target:hasStatusEffect(EFFECT_PARALYSIS)) then --effect already on, do nothing
        spell:setMsg(75);
    else
        -- Calculate duration.
        local duration = 120;

        local dMND = caster:getStat(MOD_MND) - target:getStat(MOD_MND);

        -- Calculate potency.
        local potency = math.floor(dMND / 4) + 15;
        if (potency > 25) then
            potency = 25;
        end

        if (potency < 5) then
            potency = 5;
        end
        --printf("Duration : %u",duration);
        --printf("Potency : %u",potency);
        local params = {};
        params.diff = nil;
        params.attribute = MOD_MND;
        params.skillType = 35;
        params.bonus = 0;
        params.effect = EFFECT_PARALYSIS;
        resist = applyResistanceEffect(caster, target, spell, params);

        if (resist >= 0.5) then --there are no quarter or less hits, if target resists more than .5 spell is resisted completely
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
