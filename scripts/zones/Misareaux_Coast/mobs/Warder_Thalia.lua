-----------------------------------
-- Area: Misareaux Coast
--  Mob: Warder_Thalia
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    if (ally:getCurrentMission(COP) == A_PLACE_TO_RETURN and ally:getVar("PromathiaStatus") == 1) then
        ally:setVar("Warder_Thalia_KILL",1);
    end
end;