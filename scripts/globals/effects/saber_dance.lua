-----------------------------------
--
-- EFFECT_SABER_DANCE
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local saberDanceMerits = target:getMerit(MERIT_SABER_DANCE);
    if (saberDanceMerits>5) then
        target:addMod(MOD_SAMBA_PDURATION, (saberDanceMerits -5));
    end
    -- Does not stack with warrior Double Attack trait, so disable it
    if (target:hasTrait(15)) then --TRAIT_DOUBLE_ATTACK
        target:delMod(MOD_DOUBLE_ATTACK, 10);
    end
    target:addMod(MOD_DOUBLE_ATTACK,effect:getPower());
    
    target:delStatusEffect(EFFECT_FAN_DANCE);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
   local power = effect:getPower();
   local decayby = 0;
   -- Double attack rate decays until 20% then stays there
   if (power > 20) then
        decayby = 3;
        effect:setPower(power-decayby);
        target:delMod(MOD_DOUBLE_ATTACK,decayby);
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local saberDanceMerits = target:getMerit(MERIT_SABER_DANCE);
    if (saberDanceMerits>1) then
        target:delMod(MOD_SAMBA_PDURATION, (saberDanceMerits -5));
    end
    if (target:hasTrait(15)) then --TRAIT_DOUBLE_ATTACK
        -- put Double Attack trait back on.
        target:addMod(MOD_DOUBLE_ATTACK, 10);
    end
	target:delMod(MOD_DOUBLE_ATTACK,effect:getPower());
end;
