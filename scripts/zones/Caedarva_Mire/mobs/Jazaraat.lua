-----------------------------------
-- Area: Caedarva Mire
--  MOB: Jazaraat
-----------------------------------
require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(TOAU) == LOST_KINGDOM) then
        player:setVar("AhtUrganStatus", 2);
    end
end;
