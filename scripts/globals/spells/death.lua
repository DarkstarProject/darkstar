-----------------------------------------
-- Spell: Death
-- Instant K.O.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:hasStatusEffect(EFFECT_MAGIC_SHIELD) or math.random(0,99) < target:getMod(MOD_DEATHRES)) then
        spell:setMsg(75);
        return 0;
    end

    -- falls to the ground
    spell:setMsg(20);
    target:setHP(0);

    return 0;
end;