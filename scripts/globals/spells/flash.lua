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
    dINT = (caster:getStat(MOD_MND)*2 - target:getStat(MOD_MND));

    -- apply bonus, flash is hard to fully resist
    bonus = AffinityBonus(caster,spell);

    local resist = applyResistance(caster,spell,target,dINT,DIVINE_MAGIC_SKILL,bonus);
    duration = 12 * resist;

    if(resist > 0.0625) then
        if(target:hasStatusEffect(EFFECT_FLASH) == false) then
            spell:setMsg(236);
            target:addStatusEffect(EFFECT_FLASH,100,0,duration);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end
	return EFFECT_FLASH;
end;
