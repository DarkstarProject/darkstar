-----------------------------------
-- Area: Leujaoam Sanctum (Leujaoam Cleansing)
-- NPC:  Leujaoam Worm
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

function onMobDeath(mob, killer)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
	local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);
end;