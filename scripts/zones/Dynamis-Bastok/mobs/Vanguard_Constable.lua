-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Vanguard Constable
-----------------------------------
require("scripts/globals/dynamis");
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (mob:getID() == 17539304 and alreadyReceived(player,5) == false) then
        player:addTimeToDynamis(10);
        addDynamisList(player,16);
    end

end;