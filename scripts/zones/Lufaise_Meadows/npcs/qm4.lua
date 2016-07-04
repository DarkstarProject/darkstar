-----------------------------------
-- Area: Lufaise Meadows
-- NPC:  ??? - spawns Splinterspine Grukjuk for quest "A Hard Day's Knight"
-- @pos -38.605 -9.022 -290.700 24
-----------------------------------
package.loaded["scripts/zones/Lufaise_Meadows/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Lufaise_Meadows/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    -- NOTE: uncertain of retailness of messages. Had expected but did not find any csid.
    if (GetMobAction(16875774) == 0 and player:getQuestStatus(OTHER_AREAS,A_HARD_DAY_S_KNIGHT) == QUEST_ACCEPTED and player:getVar("SPLINTERSPINE_GRUKJUK") <= 1) then 
        player:messageSpecial(SURVEY_THE_SURROUNDINGS);
        player:messageSpecial(MURDEROUS_PRESENCE);
        player:setVar("SPLINTERSPINE_GRUKJUK",1);
        SpawnMob(16875774,120):updateClaim(player); -- Splinterspine Grukjuk
    else
        player:messageSpecial(YOU_CAN_SEE_FOR_MALMS);
        player:messageSpecial(NOTHING_OUT_OF_THE_ORDINARY);
    end

end;