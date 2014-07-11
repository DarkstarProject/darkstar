-----------------------------------
-- Area: Attohwa Chasm
--  NM:  Sargas
-----------------------------------
require("scripts/globals/status");
-----------------------------------


-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
    mob:addStatusEffect(EFFECT_SHOCK_SPIKES,50,0,0);
    mob:getStatusEffect(EFFECT_SHOCK_SPIKES):setFlag(32);
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)
    -- Guestimating 2 in 3 chance to stun on melee.
    if ((math.random(1,100) >= 66) or (target:hasStatusEffect(EFFECT_STUN) == true)) then
        return 0,0,0;
    else
        local duration = math.random(5,15);
        target:addStatusEffect(EFFECT_STUN,5,3,duration);
        return SUBEFFECT_STUN,0,EFFECT_STUN;
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    -- UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((7200),(10800))); -- 2 to 3 hrs
end;