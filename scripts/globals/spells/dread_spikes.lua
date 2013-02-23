-----------------------------------------
-- Spell: Dread Spikes
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    duration = 60;
  local typeEffect = EFFECT_DREAD_SPIKES;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end
   if(target:addStatusEffect(typeEffect,power,0,duration)) then
     spell:setMsg(230);
   else
     spell:setMsg(75);
   end

   return typeEffect;
end;
