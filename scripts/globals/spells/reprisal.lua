-----------------------------------------
-- Spell: Reprisal
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local duration = 60
    local maxReflectedDamage = target:getMaxHP() * 2
    local reflectedPercent = 33
  local typeEffect = dsp.effect.REPRISAL
    if (caster:hasStatusEffect(dsp.effect.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3
    end

   if (target:addStatusEffect(typeEffect,reflectedPercent, 0,duration, 0, maxReflectedDamage, 1)) then
     spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
   else
     spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
   end

    return typeEffect
end
