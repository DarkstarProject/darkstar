-----------------------------------------
-- Spell: Maiden's Virelai
-- Charms pet
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/pets");
require("scripts/globals/msg");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (caster:getPet() ~= nil) then
        return msgBasic.ALREADY_HAS_A_PET;
    elseif (target:getMaster() ~= nil and target:getMaster():isPC()) then
        return msgBasic.THAT_SOMEONES_PET;
    end

    -- Per wiki, Virelai wipes all shadows even if it resists or the target is immune to charm
    -- This can't be done in the onSpellCast function (that runs after it "hits")
    spell:setFlag(SPELLFLAG_WIPE_SHADOWS);

    return 0;
end;

function onSpellCast(caster,target,spell)
    local dCHR = (caster:getStat(MOD_CHR) - target:getStat(MOD_CHR));
    local bonus = 0; -- No idea what value, but seems likely to need this edited later to get retail resist rates.
    local params = {};
    params.diff = nil;
    params.attribute = MOD_CHR;
    params.skillType = SINGING_SKILL;
    params.bonus = bonus;
    params.effect = EFFECT_CHARM_I;
    resist = applyResistanceEffect(caster, target, spell, params);
    -- print(resist);
    if (resist >= 0.25 and caster:getCharmChance(target, false) > 0) then
        spell:setMsg(236);
        if (caster:isMob())then
            target:addStatusEffect(EFFECT_CHARM_I, 0, 0, 30*resist);
            caster:charm(target);
        else
            caster:charmPet(target);
        end
    else
        -- Resist
        spell:setMsg(85);
    end

    return EFFECT_CHARM_I;
end;