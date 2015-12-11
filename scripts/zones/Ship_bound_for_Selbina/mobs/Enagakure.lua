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

function onMobDeath(mob,killer,ally)

    if (ally:hasKeyItem(SEANCE_STAFF) and ally:getVar("Enagakure_Killed") == 0) then
        ally:setVar("Enagakure_Killed",1);
    end

end;