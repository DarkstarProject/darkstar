-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Harvestman
-- !pos 398.130 -10.675 179.169 52
-----------------------------------
require("scripts/globals/msg");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)
    -- Guesstimating 1 in 4 chance to poison on melee.
    if ((math.random(1,100) >= 25) or (target:hasStatusEffect(EFFECT_POISON) == true)) then
        return 0,0,0;
    else
        local duration = math.random(6,9); -- 2-3 Tick's
        target:addStatusEffect(EFFECT_POISON,100,3,duration);
        return SUBEFFECT_POISON,msgBasic.ADD_EFFECT_STATUS,EFFECT_POISON;
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Set Harvesman's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));
end;
