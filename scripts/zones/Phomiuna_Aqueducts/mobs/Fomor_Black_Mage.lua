-----------------------------------
-- Area: Phomiuna_Aqueducts
--  MOB: Fomor Black Mage
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    local kills = player:getVar("FOMOR_HATE");

    if (kills < 60) then
        player:setVar("FOMOR_HATE",kills + 2);
    end
end;