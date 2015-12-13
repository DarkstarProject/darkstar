-----------------------------------
-- Area: West Ronfaure
--  MOB: Marauder Dvogzog
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    if (ally:getCurrentMission(SANDORIA) == PRESTIGE_OF_THE_PAPSQUE and ally:getVar("MissionStatus") == 1) then
        ally:setVar("Mission7-1MobKilled",1);
    end
    checkRegime(ally,mob,4,1);
end;
