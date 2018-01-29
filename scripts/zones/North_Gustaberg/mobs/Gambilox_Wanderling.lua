-----------------------------------
-- Area: North Gusberg
--  MOB: Gambilox Wanderling
-- Quest NM - "As Thick as Thieves"
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    local thickAsThievesGamblingCS = player:getVar("thickAsThievesGamblingCS");

    if (thickAsThievesGamblingCS == 5) then
        player:setVar("thickAsThievesGamblingCS",6)
    end
end;