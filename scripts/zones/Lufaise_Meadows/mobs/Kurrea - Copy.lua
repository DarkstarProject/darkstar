-----------------------------------
-- Area: Lufaise Meadows
-- NPC:  Kurrea
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_MACC,500);	
	mob:addMod(MOD_REGAIN,33);	
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;