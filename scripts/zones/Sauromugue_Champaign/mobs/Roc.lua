-----------------------------------
--  Area: Sauromugue Champaign (120)
--   Mob: Roc
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    killer:addTitle(ROC_STAR);

    -- Set Roc's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((75600),(86400)));

end;

