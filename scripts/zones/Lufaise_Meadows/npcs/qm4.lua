-----------------------------------
-- Area: Lufaise Meadows
--  NPC: ??? - spawns Splinterspine Grukjuk for quest "A Hard Day's Knight"
-- !pos -38.605 -9.022 -290.700 24
-----------------------------------
package.loaded["scripts/zones/Lufaise_Meadows/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lufaise_Meadows/TextIDs");
require("scripts/zones/Lufaise_Meadows/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- NOTE: uncertain of retailness of messages. Had expected but did not find any csid.
    if (
        player:getQuestStatus(OTHER_AREAS_LOG,A_HARD_DAY_S_KNIGHT) == QUEST_ACCEPTED and
        player:getVar("SPLINTERSPINE_GRUKJUK") <= 1 and
        not GetMobByID(SPLINTERSPINE_GRUKJUK):isSpawned()
    ) then
        player:messageSpecial(SURVEY_THE_SURROUNDINGS);
        player:messageSpecial(MURDEROUS_PRESENCE);
        player:setVar("SPLINTERSPINE_GRUKJUK",1);
        SpawnMob(SPLINTERSPINE_GRUKJUK):updateClaim(player);
    else
        player:messageSpecial(YOU_CAN_SEE_FOR_MALMS);
        player:messageSpecial(NOTHING_OUT_OF_THE_ORDINARY);
    end
end;
