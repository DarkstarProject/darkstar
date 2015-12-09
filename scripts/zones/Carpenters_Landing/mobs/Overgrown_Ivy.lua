-----------------------------------
-- Area: Carpenters_Landing
--  Mob: Overgrown_Ivy
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    if (ally:getCurrentMission(COP) == THE_ROAD_FORKS and ally:getVar("EMERALD_WATERS_Status") == 4) then
        ally:setVar("EMERALD_WATERS_Status",5);
    end
end;