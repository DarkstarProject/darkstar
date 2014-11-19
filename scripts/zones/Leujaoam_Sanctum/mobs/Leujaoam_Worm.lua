-----------------------------------
-- Area: Leujaoam Sanctum (Leujaoam Cleansing)
-- NPC:  Leujaoam Worm
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function OnMobEngaged(mob,target)
	
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