-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Vanguard Vindicator
-----------------------------------
require("scripts/globals/dynamis");
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (mob:getID() == 17539300 and alreadyReceived(player,7) == false) then
        player:addTimeToDynamis(10);
        addDynamisList(player,64);
    end
end;
