-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Nio A
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getCurrentMission(SANDORIA) == LIGHTBRINGER and ally:getVar("Mission8-2Kills") < 2) then
        ally:setVar("Mission8-2Kills", ally:getVar("Mission8-2Kills") + 1);
    end
end;