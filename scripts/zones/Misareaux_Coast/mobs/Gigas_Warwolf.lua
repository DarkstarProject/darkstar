-----------------------------------
-- Area: Misareaux_Coast
-- mob :Gigas Warwolf
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

    if (kills > 0) then
        ally:setVar("FOMOR_HATE",kills -1);
    end
end;