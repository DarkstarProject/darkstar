-----------------------------------------
-- Spell: Ice Spikes
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

   target:delStatusEffect(EFFECT_BLAZE_SPIKES);
   target:delStatusEffect(EFFECT_ICE_SPIKES);
   target:delStatusEffect(EFFECT_SHOCK_SPIKES);
   target:delStatusEffect(EFFECT_DREAD_SPIKES);

    local int = caster:getStat(MOD_INT);
    local magicAtk = caster:getMod(MOD_MATT);
    local power = ((int + 10) / 20 + 2) * (1 + (magicAtk / 100));

   target:addStatusEffect(EFFECT_ICE_SPIKES,power,0,duration);
end;
