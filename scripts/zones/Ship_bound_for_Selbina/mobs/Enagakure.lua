-----------------------------------
-- Area: Balga Dais
--  MOB: Enagakure
-- Involved in Quest: I'll Take the Big Box
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

    if (player:hasKeyItem(SEANCE_STAFF) and player:getVar("Enagakure_Killed") == 0) then
        player:setVar("Enagakure_Killed",1);
    end

end;