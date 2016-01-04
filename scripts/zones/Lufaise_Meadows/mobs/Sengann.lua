-----------------------------------
-- Zone: Lufaise_Meadows
-- Mob:  Sengann
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
        ally:setVar("FOMOR_HATE",kills + 2);
    end
end;