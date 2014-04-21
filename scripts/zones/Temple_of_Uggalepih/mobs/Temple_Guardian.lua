-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Temple Guardian
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
	GetNPCByID(17428956):openDoor(300); -- 5min
end;