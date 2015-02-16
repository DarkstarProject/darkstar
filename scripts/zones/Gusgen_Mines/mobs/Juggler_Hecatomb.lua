-----------------------------------
-- Area: Gusgen Mines
-- NM:   Juggler_Hecatomb
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
	mob:addMod(MOD_STR,5);
	mob:addMod(MOD_DEX,7);
	mob:addMod(MOD_ATT,100);
	mob:addMod(MOD_ACC,200);
	mob:addMod(MOD_MACC,400);
    mob:addMod(MOD_REGAIN,33);
	mob:addMod(MOD_DOUBLE_ATTACK,15);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob,target)
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    killer:addTitle(BLOODY_BERSERKER);
    
    -- Set Juggler_Hecatomb's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((75600),(86400)));
    
end;