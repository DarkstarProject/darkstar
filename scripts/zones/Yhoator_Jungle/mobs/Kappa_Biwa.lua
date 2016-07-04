-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Kappa Biwa
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

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(OUTLANDS,TRUE_WILL) == QUEST_ACCEPTED) then
        player:setVar("trueWillKilledNM",player:getVar("trueWillKilledNM") + 1);
    end

end;