-----------------------------------------
-- Spell: Esuna
--
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    local count = 1;

    local removables = {EFFECT_FLASH, EFFECT_BLINDNESS, EFFECT_PARALYSIS, EFFECT_POISON, EFFECT_CURSE_I, EFFECT_CURSE_II, EFFECT_DISEASE, EFFECT_PLAGUE};

    local has = {};

    -- collect a list of what caster currently has
    for i, effect in ipairs(removables) do
        if(caster:hasStatusEffect(effect)) then
            has[i] = true;
        end
    end

    -- remove effects only if cast has it as well
    for i, effect in ipairs(removables) do

        if(has[i] and target:hasStatusEffect(effect)) then
            spell:setMsg(83);
            target:delStatusEffect(effect);
            return effect;
        end
    end

    spell:setMsg(75); -- no effect

    return 0;
end;
