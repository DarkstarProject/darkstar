-----------------------------------
-- Minotaur
-----------------------------------

require("scripts/globals/missions");

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

    if (kills > 1) then
        ally:setVar("FOMOR_HATE",kills - 2);
    else
        ally:setVar("FOMOR_HATE",0);
    end

    if (ally:getCurrentMission(COP) == DISTANT_BELIEFS and ally:getVar("PromathiaStatus") == 0) then
        ally:setVar("PromathiaStatus",1);
    end

end;