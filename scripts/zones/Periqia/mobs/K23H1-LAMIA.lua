-----------------------------------
-- Area: Periqia (Shades of Vengeance)
--  MOB: K23H1-LAMIA
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance();
    local progress = math.random(1,4);
    instance:setProgress(instance:getProgress() + progress);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
