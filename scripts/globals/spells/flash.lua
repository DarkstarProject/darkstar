-----------------------------------------
-- Spell: Flash
-- Temporarily blinds an enemy, greatly lowering its accuracy.
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    -- Pull base stats.
    dINT = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));

    -- apply bonus, flash is hard to fully resist
    bonus = AffinityBonus(caster,spell);

    local resist = applyResistance(caster,spell,target,dINT,DIVINE_MAGIC_SKILL,bonus);
    duration = 12 * resist;

    if(resist > 0.0625) then
        if(target:hasStatusEffect(EFFECT_FLASH) == false) then
            spell:setMsg(236);
            target:addStatusEffect(EFFECT_FLASH,100,0,duration); -- Guess at power for now.
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end
	return 156;
end;
