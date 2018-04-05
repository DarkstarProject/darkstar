-----------------------------------------
-- Spell: Blaze Spikes
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local duration = SPIKE_EFFECT_DURATION;
  local typeEffect = dsp.effects.BLAZE_SPIKES;
    if (caster:hasStatusEffect(dsp.effects.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    local int = caster:getStat(MOD_INT);
    local magicAtk = caster:getMod(MOD_MATT);
    local power = ((int + 2) / 12 + 4) * (1 + (magicAtk / 100));

   if (target:addStatusEffect(typeEffect,power,0,duration)) then
     spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
   else
     spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
   end

   return typeEffect;
end;
