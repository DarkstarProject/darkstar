-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  Magma
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
	GetNPCByID(17617210):hideNPC(900); -- 15min, qm4 in npc_list
end;