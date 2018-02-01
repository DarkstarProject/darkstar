-----------------------------------
-- Area: Caedarva Mire
--  MOB: Lamia No 27
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(AHT_URHGAN,NOT_MEANT_TO_BE) == QUEST_ACCEPTED and player:getVar("notmeanttobeCS") == 3 and player:getVar("notmeanttobeLamia27Killed") < 1) then
        player:setVar("notmeanttobeLamia27Killed",1);
    end

end;
