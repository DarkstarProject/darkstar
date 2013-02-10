-----------------------------------------
-- Spell: Blaze Spikes
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	duration = 180;
	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end

    local int = caster:getStat(MOD_INT);
    local magicAtk = caster:getMod(MOD_MATT);
    local power = ((int + 2) / 12 + 4) * (1 + (magicAtk / 100));

   target:delStatusEffect(EFFECT_BLAZE_SPIKES);
   target:delStatusEffect(EFFECT_ICE_SPIKES);
   target:delStatusEffect(EFFECT_SHOCK_SPIKES);
   target:delStatusEffect(EFFECT_DREAD_SPIKES);

   target:addStatusEffect(EFFECT_BLAZE_SPIKES,power,0,duration);
end;
