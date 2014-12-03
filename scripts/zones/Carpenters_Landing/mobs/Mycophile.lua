-----------------------------------
-- Area: Carpenters' Landing
-- Mob:  Mycophile
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
	GetNPCByID(16785727):hideNPC(900);
end;