-----------------------------------
-- Area: VeLugannon Palace
-- NPC:  Brigandish Blade
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
function onMobDeath(mob, killer)
	GetNPCByID(17502582):hideNPC(300);
end;