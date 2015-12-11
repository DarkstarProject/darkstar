-----------------------------------
-- Area: Phomiuna_Aqueducts
--  MOB: Eba
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    local kills = ally:getVar("FOMOR_HATE");

    if (kills < 60) then
        ally:setVar("FOMOR_HATE",kills + 4);
    end
end;