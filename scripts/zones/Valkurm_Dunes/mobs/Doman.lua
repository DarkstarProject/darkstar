-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Doman
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

function onMobDeath(mob,killer,ally)

    if (ally:hasKeyItem(YOMOTSU_HIRASAKA)) then
        ally:setVar("OkuriNMKilled",ally:getVar("OkuriNMKilled") + 1);
    end

end;