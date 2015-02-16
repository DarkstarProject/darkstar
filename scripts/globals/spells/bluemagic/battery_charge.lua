-----------------------------------------
-- Bluemagic: Battery Charge
-- Gradually restores MP
-- MP +10  MND +1
-- Lvl.: 79 MP Cost: 50 Blue Points: 3
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------
function onSpellCast(caster,target,spell)

    if(target:hasStatusEffect(EFFECT_REFRESH)) then
        target:delStatusEffect(EFFECT_REFRESH);
    end

    if(target:addStatusEffect(EFFECT_REFRESH,3,3,300)) then
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect
    end

    return EFFECT_REFRESH;

end;
