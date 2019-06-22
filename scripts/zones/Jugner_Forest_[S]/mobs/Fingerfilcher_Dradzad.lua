-----------------------------------
-- Area: Jugner Forest [S]
--   NM: Fingerfilcher Dradzad
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.CLAWS_OF_THE_GRIFFON) == QUEST_ACCEPTED) then
        player:setVar("FingerfilcherKilled",1);
    end
end;
