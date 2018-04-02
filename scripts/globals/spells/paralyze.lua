-----------------------------------------
-- Spell: Paralyze
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    if (target:hasStatusEffect(EFFECT.PARALYSIS)) then -- Effect already on, do nothing
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    else
        -- Calculate duration.
        local duration = 120;

        if (caster:hasStatusEffect(EFFECT.SABOTEUR)) then
            duration = duration * 2;
        end

        local dMND = caster:getStat(MOD_MND) - target:getStat(MOD_MND);

        -- Calculate potency.
        local potency = math.floor(dMND / 4) + 15;
        if (potency > 25) then
            potency = 25;
        end

        if (potency < 5) then
            potency = 5;
        end

        if (caster:hasStatusEffect(EFFECT.SABOTEUR)) then
            potency = potency * 2;
            caster:delStatusEffect(EFFECT.SABOTEUR);
        end
        -- printf("Duration : %u",duration);
        -- printf("Potency : %u",potency);
        local params = {};
        params.diff = nil;
        params.attribute = MOD_MND;
        params.skillType = 35;
        params.bonus = 0;
        params.effect = EFFECT.PARALYSIS;
        local resist = applyResistanceEffect(caster, target, spell, params);

        if (resist >= 0.5) then -- There are no quarter or less hits, if target resists more than .5 spell is resisted completely
            if (target:addStatusEffect(EFFECT.PARALYSIS,potency,0,duration*resist)) then
                spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
            else
                -- no effect
                spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
            end
        else
            -- resist
            spell:setMsg(msgBasic.MAGIC_RESIST);
        end
    end

    return EFFECT.PARALYSIS;
end;
