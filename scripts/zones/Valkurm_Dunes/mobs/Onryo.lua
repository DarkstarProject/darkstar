-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Onryo
-- Involved in Quest: Yomi Okuri
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:hasKeyItem(YOMOTSU_HIRASAKA)) then
        player:setVar("OkuriNMKilled",player:getVar("OkuriNMKilled") + 1);
    end

end;