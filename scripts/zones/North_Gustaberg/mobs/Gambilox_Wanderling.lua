-----------------------------------
-- Area: North Gusberg
--  MOB: Gambilox Wanderling
-- Quest NM - "As Thick as Thieves"
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)

    local thickAsThievesGamblingCS = ally:getVar("thickAsThievesGamblingCS");

    if (thickAsThievesGamblingCS == 5) then
        ally:setVar("thickAsThievesGamblingCS",6)
    end
end;