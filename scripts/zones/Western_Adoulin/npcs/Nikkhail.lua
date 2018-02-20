-----------------------------------
-- Area: Western Adoulin
--  NPC: Nikkhail
-- Type: Standard NPC and Quest NPC
--  Involved With Quest: 'A Thirst for the Ages'
--  @zone 256
-- !pos -101 3 9
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Western_Adoulin/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local ATFTA = player:getQuestStatus(ADOULIN, A_THIRST_FOR_THE_AGES);
    local ATFTA_Need_KI = ((player:getVar("ATFTA_Status") < 2) and (not player:hasKeyItem(COPY_OF_THE_ALLIANCE_AGREEMENT)));

    local SOA_Mission = player:getCurrentMission(SOA);

    if (SOA_Mission >= LIFE_ON_THE_FRONTIER) then
        if ((ATFTA == QUEST_ACCEPTED) and ATFTA_Need_KI) then
            -- Progresses Quest: 'A Thirst for the Ages'
            player:startEvent(5053);
        else
            -- Standard dialogue, after joining colonization effort
            player:startEvent(584);
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(510);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 5053) then
        -- Progresses Quest: 'A Thirst for the Ages'
        player:addKeyItem(COPY_OF_THE_ALLIANCE_AGREEMENT);
        player:messageSpecial(KEYITEM_OBTAINED, COPY_OF_THE_ALLIANCE_AGREEMENT);
    end
end;
