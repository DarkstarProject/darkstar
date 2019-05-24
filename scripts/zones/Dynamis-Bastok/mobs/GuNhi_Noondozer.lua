-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Gu'Nhi Noondozer
-- Time Extender: 30min
-----------------------------------
require("scripts/globals/dynamis");
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (alreadyReceived(player,4) == false) then
        player:addTimeToDynamis(30);
        addDynamisList(player,8);
    end

end;