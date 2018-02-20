-----------------------------------
-- Area: North Gustaberg (S) (I-6)
--  NPC: Gebhardt
-- Involved in Quests: The Fighting Fourth
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg_[S]/TextIDs"] = nil;
package.loaded["scripts/globals/quests"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/North_Gustaberg_[S]/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR,THE_FIGHTING_FOURTH) == QUEST_ACCEPTED and player:hasKeyItem(917)) == true then
        player:startEvent(102)
    else
        player:startEvent(110)
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 102) then
            player:delKeyItem(BATTLE_RATIONS);
            player:setVar("THE_FIGHTING_FOURTH",1);
    end
end;
