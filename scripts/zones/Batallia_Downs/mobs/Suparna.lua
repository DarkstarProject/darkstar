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

function onMobDeath(mob,killer,ally)

    local kills = ally:getVar("Mission9-1Kills");

    if (ally:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and ally:getVar("MissionStatus") == 3 and kills < 2) then
        ally:setVar("Mission9-1Kills",kills + 1);
    end

end;