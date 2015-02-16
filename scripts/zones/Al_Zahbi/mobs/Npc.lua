





require("scripts/globals/settings");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    -- Set respawn time (9-12 hours)(32400),(43200)
    mob:setRespawnTime(math.random((10),(32)));

end;


-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob, target)

	mob:getMaxHP();
end;
