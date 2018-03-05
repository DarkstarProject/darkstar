-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Kappa Bonze
-- Involved in Quest: True will
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(OUTLANDS,TRUE_WILL) == QUEST_ACCEPTED) then
        player:setVar("trueWillKilledNM",player:getVar("trueWillKilledNM") + 1);
    end

end;