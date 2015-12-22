-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Kappa Bonze
-- Involved in Quest: True will
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getQuestStatus(OUTLANDS,TRUE_WILL) == QUEST_ACCEPTED) then
        ally:setVar("trueWillKilledNM",ally:getVar("trueWillKilledNM") + 1);
    end

end;