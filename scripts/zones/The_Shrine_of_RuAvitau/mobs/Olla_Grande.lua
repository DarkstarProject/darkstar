-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Olla Grande
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
	GetNPCByID(17506692):hideNPC(900);
end;