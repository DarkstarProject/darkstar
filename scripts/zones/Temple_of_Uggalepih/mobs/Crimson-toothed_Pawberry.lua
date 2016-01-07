-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Crimson-toothed Pawberry
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
    SetServerVariable("[POP]Crimson-toothed_Pawberry",os.time(t) + 900); -- 15min
    local kills = ally:getVar("EVERYONES_GRUDGE_KILLS");
    if (kills < 480) then
        ally:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
    end
end;