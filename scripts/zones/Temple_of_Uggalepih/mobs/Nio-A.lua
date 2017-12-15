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

function onMobDeath(mob, player, isKiller)

    if (player:getCurrentMission(SANDORIA) == LIGHTBRINGER and player:getVar("Mission8-2Kills") < 2) then
        player:setVar("Mission8-2Kills", player:getVar("Mission8-2Kills") + 1);
    end
end;