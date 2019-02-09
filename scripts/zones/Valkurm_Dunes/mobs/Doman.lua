-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Doman
-- Involved in Quest: Yomi Okuri
-----------------------------------
require("scripts/globals/keyitems");
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:hasKeyItem(dsp.ki.YOMOTSU_HIRASAKA)) then
        player:addVar("OkuriNMKilled", 1);
    end

end;