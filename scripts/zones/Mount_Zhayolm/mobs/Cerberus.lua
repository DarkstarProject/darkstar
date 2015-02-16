-----------------------------------
-- Area: Mount Zhayolm
-- NPC:  Cerberus
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
	mob:addMod(MOD_MATT,75);
	mob:addMod(MOD_MACC,200);
	mob:addMod(MOD_ACC,250);
	mob:addMod(MOD_REGAIN,15);	
	mob:addMod(MOD_ATT,50);
	mob:addMod(MOD_DEF,50);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(CERBERUS_MUZZLER);
	mob:setRespawnTime(math.random((172800),(259200))); -- 48-72 hours
end;