-----------------------------------
-- Area: Batallia Downs
--  MOB: Sturmtiger
-- Involved in Quest: Chasing Quotas
-- @pos -715.882,-10.75,65.982 (105)
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

function onMobDeath(mob, player, isKiller)

    local kills = player:getVar("Mission9-1Kills");

    if (player:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and player:getVar("MissionStatus") == 3 and kills < 2) then
        player:setVar("Mission9-1Kills",kills + 1);
    end

end;