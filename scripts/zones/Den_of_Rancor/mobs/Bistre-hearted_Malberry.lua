-----------------------------------
-- Area: Den of Rancor
--  NM:  Bistre-hearted Malberry
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    local kills = ally:getVar("EVERYONES_GRUDGE_KILLS");
    if (kills < 480) then
        ally:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
    end
end;