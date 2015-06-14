-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Ullikummi
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
	GetNPCByID(17506694):hideNPC(900);
end;