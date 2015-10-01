-----------------------------------
-- Area: Temple of Uggalepih (159)
-- Mob: Habetrot
-- @pos -60 -8 58 220
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
	GetNPCByID(17428871):hideNPC(900); -- 15min, qm8 in npc_list
end;