-----------------------------------
-- Area: Misareaux_Coast
--  MOB: Fomor Monk
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local ills = player:getVar("FOMOR_HATE");

    if (kills < 60) then
        player:setVar("FOMOR_HATE",kills + 2);
    end
end;