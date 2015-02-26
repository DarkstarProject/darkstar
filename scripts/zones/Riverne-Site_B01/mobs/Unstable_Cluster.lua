-----------------------------------
-- Area: Riverne - Site B01
-- NPC:  Unstable Cluster
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
	GetNPCByID(16896175):hideNPC(900); -- (qm1 in NPC_LIST)
end;