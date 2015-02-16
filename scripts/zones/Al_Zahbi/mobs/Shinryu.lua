




require("scripts/globals/weather");
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

    -- Set respawn time (9-12 hours)
    mob:setRespawnTime(math.random((32400),(43200)));

end;


-----------------------------------
-- OnMobRoam
-----------------------------------

function OnMobRoam(mob)

	mob:addHP( 250000 );
end;


-----------------------------------
-- OnMobDisengage
-----------------------------------

function OnMobDisengage(mob)

	mob:addHP( 250000 );
end;
