-----------------------------------
-- Area: Lebros Cavern (Wamoura Farm Raid)
-- NPC:  Ranch Wamouracampa
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