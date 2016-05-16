-----------------------------------
-- Area: Ghelsba Outpost
--  MOB: Warchief Vatgit
-- Involved in Mission 2-3
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:getCurrentMission(player:getNation()) == 6) then
        if (player:getVar("MissionStatus") == 4) then
            player:setVar("MissionStatus",5);
        end
    end

    player:addTitle(WARCHIEF_WRECKER);

end;