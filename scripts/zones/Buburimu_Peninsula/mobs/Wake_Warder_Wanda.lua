-----------------------------------
-- Area: Buburimi Peninsula
--  MOB: Wake Warder Wanda
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAGIC_COOL, 50); -- just one spell to spam
    mob:addMod(MOD_SILENCERES,20);
    mob:addMod(MOD_BINDRES,20);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    mob:setMod(MOD_REGAIN, 25);
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
    mob:setMod(MOD_REGAIN,0);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,4200)); -- repop 60-70min
end;
