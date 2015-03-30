-----------------------------------
-- Area: Kuftal Tunnel
-- NM: Cancer
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
	GetNPCByID(17490254):hideNPC(900); -- qm2 in npc_list
end;