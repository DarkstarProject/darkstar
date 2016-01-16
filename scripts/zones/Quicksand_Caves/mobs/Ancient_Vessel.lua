-----------------------------------
-- Area: Quicksand Caves
--  MOB: Ancient Vessel
-- Mithra and the Crystal (Zilart 12) Fight
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getCurrentMission(ZILART) == THE_MITHRA_AND_THE_CRYSTAL and ally:getVar("ZilartStatus") == 1) then
        ally:needToZone(true);
        ally:setVar("AncientVesselKilled",1);
    end

end;