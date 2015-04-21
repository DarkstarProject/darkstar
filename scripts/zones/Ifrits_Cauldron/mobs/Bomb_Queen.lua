-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  Bomb Queen
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
	GetNPCByID(17617180):hideNPC(900); -- 15min, qm2 in npc_list
end;