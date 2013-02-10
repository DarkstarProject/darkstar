-----------------------------------------
-- Spell: Dread Spikes
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    duration = 60;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end
   target:delStatusEffect(EFFECT_BLAZE_SPIKES);
   target:delStatusEffect(EFFECT_ICE_SPIKES);
   target:delStatusEffect(EFFECT_SHOCK_SPIKES);
   target:delStatusEffect(EFFECT_DREAD_SPIKES);
   target:addStatusEffect(EFFECT_DREAD_SPIKES,0,0,duration);
end;
