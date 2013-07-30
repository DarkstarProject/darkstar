-----------------------------------------
-- Spell: Gravity
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

    -- Pull base stats.
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    local bonus = AffinityBonus(caster, spell:getElement());
    local power = 50; -- 50% reduction

    -- Duration, including resistance.  Unconfirmed.
    local duration = 120 * applyResistance(caster,spell,target,dINT,35,bonus);

    if(100 * math.random() >= target:getMod(MOD_GRAVITYRES)) then
        if(duration >= 30) then --Do it!
            if(target:addStatusEffect(EFFECT_WEIGHT,power,0,duration)) then
                spell:setMsg(236);
            else
                spell:setMsg(284);
            end
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