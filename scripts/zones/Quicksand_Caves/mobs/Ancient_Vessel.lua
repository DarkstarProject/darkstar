-----------------------------------
-- Area: Quicksand Caves
--  MOB: Ancient Vessel
-- Mithra and the Crystal (Zilart 12) Fight
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THE_MITHRA_AND_THE_CRYSTAL and player:getVar("ZilartStatus") == 1) then
        player:needToZone(true);
        player:setVar("AncientVesselKilled",1);
    end

end;