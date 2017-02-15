-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Faust
-----------------------------------

-- TODO: Faust should WS ~3 times in a row each time.

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
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
    mob:setRespawnTime(math.random(60,120)); -- respawn 5-10 min
end;