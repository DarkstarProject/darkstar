-----------------------------------
-- Area: Jugner Forest [S]
--   NM: Fingerfilcher Dradzad
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onMobEngaged(mob,target)
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getQuestStatus(CRYSTAL_WAR, CLAWS_OF_THE_GRIFFON) == QUEST_ACCEPTED) then
        player:setVar("FingerfilcherKilled",1);
    end
end;
