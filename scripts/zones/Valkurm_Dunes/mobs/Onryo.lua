-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Onryo
-- Involved in Quest: Yomi Okuri
-----------------------------------
require("scripts/globals/keyitems");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:hasKeyItem(dsp.kis.YOMOTSU_HIRASAKA)) then
        player:setVar("OkuriNMKilled",player:getVar("OkuriNMKilled") + 1);
    end

end;