-----------------------------------
-- Area: Caedarva Mire
-- NPC:  Aynu Kasey
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    mob:setRespawnTime(math.random((7200),(14400)));
end;
