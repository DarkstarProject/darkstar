-----------------------------------------
-- Spell: Gravity
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    -- Pull base stats.
    dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    bonus = AffinityBonus(caster,spell);
    power = 50; -- 50% reduction

    -- Duration, including resistance.  Unconfirmed.
    duration = 120 * applyResistance(caster,spell,target,dINT,35,bonus);

    if(100 * math.random() >= target:getMod(MOD_GRAVITYRES)) then
        if(duration >= 30) then --Do it!
            target:delStatusEffect(EFFECT_WEIGHT);
            target:addStatusEffect(EFFECT_WEIGHT,power,0,duration);
                    spell:setMsg(267);
        else
--          if(spell:isAOE() == false) then
--              spell:setMsg(85);
--          else
                spell:setMsg(284);
--          end
        end
    else
--      if(spell:isAOE() == false) then
--          spell:setMsg(85);
--      else
            spell:setMsg(284);
--      end
    end
    return EFFECT_WEIGHT;
end;