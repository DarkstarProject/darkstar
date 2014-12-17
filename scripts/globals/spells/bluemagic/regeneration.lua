-----------------------------------------
-- Bluemagic: Regeneration
-- Gradually restores HP
-- MND +2
-- Lvl.: 78 MP Cost: 36 Blue Points: 2
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- onMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------
function onSpellCast(caster,target,spell)

    if(target:hasStatusEffect(EFFECT_REGEN) and target:getStatusEffect(EFFECT_REGEN):getTier() == 1) then
        target:delStatusEffect(EFFECT_REGEN);
    end

    if(target:addStatusEffect(EFFECT_REGEN,10,3,90,0,0,0)) then
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect
    end

    return EFFECT_REGEN;

end;