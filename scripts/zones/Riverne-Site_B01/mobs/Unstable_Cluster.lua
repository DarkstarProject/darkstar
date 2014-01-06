-----------------------------------
-- Area: Riverne - Site B01
-- NPC:  Unstable Cluster
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	GetNPCByID(16896175):hideNPC(900); -- (qm1 in NPC_LIST)
end;