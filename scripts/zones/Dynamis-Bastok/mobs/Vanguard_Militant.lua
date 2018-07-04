-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Vanguard Militant
-----------------------------------
require("scripts/globals/dynamis");
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (mob:getID() == 17539301 and alreadyReceived(player,6) == false) then
        player:addTimeToDynamis(10);
        addDynamisList(player,32);
    end
end;
