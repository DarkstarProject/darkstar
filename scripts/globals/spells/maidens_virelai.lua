-----------------------------------------
-- Spell: Maiden's Virelai
-- Charms pet
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    -- Ix'Aern DRG pets are Wyverns that 2hour.
    if (caster:getID() >= 16921023 and caster:getID() <= 16921025) then
        -- This would probably be better to handle in the mobs script but eh w/e..
        if (caster:getStatusEffect(EFFECT_SOUL_VOICE) == nil) then
            return 1;
        end
    elseif (caster:getPet() ~= nil) then
        return MSGBASIC_ALREADY_HAS_A_PET;
    elseif (target:getMaster() ~= nil and target:getMaster():isPC()) then
        return MSGBASIC_THAT_SOMEONES_PET;
    end

    -- Per wiki, Virelai wipes all shadows even if it resists or the target is immune to charm
    -- This can't be done in the onSpellCast function, so its here.
    target:delStatusEffect(EFFECT_COPY_IMAGE);
    target:delStatusEffect(EFFECT_BLINK);

    return 0;
end;

function onSpellCast(caster,target,spell)
    local dCHR = (caster:getStat(MOD_CHR) - target:getStat(MOD_CHR));
    local bonus = 0; -- No idea what value, but seems likely to need this edited later to get retail resist rates.
    local resist = applyResistanceEffect(caster,spell,target,dCHR,SINGING_SKILL,bonus,EFFECT_CHARM_I);

    if (resist >= 0.25 and caster:getCharmChance(target, false) > 0) then
        spell:setMsg(236);
        if (caster:isMob())then
            target:addStatusEffect(EFFECT_CHARM_I, 0, 0, 30*resist);
            caster:charm(target);
        else
            caster:charmPet(target);
        end
    else
        -- resist
        spell:setMsg(85);
    end

    return EFFECT_CHARM_I;
end;