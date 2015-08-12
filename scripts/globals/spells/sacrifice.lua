-----------------------------------------
-- Spell: Sacrifice
--
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
    local count = 1;

    local removables = {EFFECT_FLASH, EFFECT_BLINDNESS, EFFECT_PARALYSIS, EFFECT_POISON, EFFECT_CURSE_I, EFFECT_CURSE_II, EFFECT_DISEASE, EFFECT_PLAGUE};

    -- remove one effect and add it to me
    for i, effect in ipairs(removables) do

        if (target:hasStatusEffect(effect)) then
            spell:setMsg(572);

            local statusEffect = target:getStatusEffect(effect);

            -- only add it to me if I don't have it
            if (caster:hasStatusEffect(effect) == false) then
                caster:addStatusEffect(effect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration());
            end

            target:delStatusEffect(effect);
            return 1;
        end
    end

    spell:setMsg(75); -- no effect
    return 0;
end;
