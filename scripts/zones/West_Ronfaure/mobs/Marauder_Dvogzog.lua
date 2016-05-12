-----------------------------------
-- Area: West Ronfaure
--  MOB: Marauder Dvogzog
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(SANDORIA) == PRESTIGE_OF_THE_PAPSQUE and player:getVar("MissionStatus") == 1) then
        player:setVar("Mission7-1MobKilled",1);
    end
    checkRegime(player,mob,4,1);
end;
