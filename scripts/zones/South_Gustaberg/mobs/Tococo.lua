-----------------------------------
-- Area: South Gustaberg
--  NM:  Tococo
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
end;

function onAdditionalEffect(mob,target,damage)
    -- Guesstimating 1 in 3 chance to poison on melee.
    if ((math.random(1,100) >= 33) or (target:hasStatusEffect(dsp.effect.POISON) == true)) then
        return 0,0,0;
    else
        local duration = math.random(5,15);
        target:addStatusEffect(dsp.effect.POISON,5,3,duration);
        return dsp.subEffect.POISON,0,dsp.effect.POISON;
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,4200));
end;