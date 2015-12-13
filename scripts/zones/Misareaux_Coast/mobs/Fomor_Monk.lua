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

function onMobDeath(mob, killer, ally)
    local ills = ally:getVar("FOMOR_HATE");

    if (kills < 60) then
        ally:setVar("FOMOR_HATE",kills + 2);
    end
end;