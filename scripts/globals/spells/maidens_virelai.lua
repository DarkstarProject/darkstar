-----------------------------------------
-- Spell: Maiden's Virelai
-- Charms pet
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    -- Ix'Aern DRG pets are Wyverns that 2hour.
    if (mob:getID() >= 16921023 and mob:getID() <= 16921025) then
        if (caster:getStatusEffect(EFFECT_SOUL_VOICE)  == nil) then
            return 1;
        end
    end
    
    return 0;
end;

function onSpellCast(caster,target,spell)

    spell:setMsg(137);

    return EFFECT_CHARM;
end;