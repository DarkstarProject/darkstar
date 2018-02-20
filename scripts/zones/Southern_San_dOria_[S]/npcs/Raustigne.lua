-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Raustigne
-- @zone 80
-- !pos 4 -2 44
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/settings");


function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR, CLAWS_OF_THE_GRIFFON) == QUEST_COMPLETED and player:getVar("BoyAndTheBeast") == 0) then
        if (player:getCurrentMission(WOTG) == CAIT_SITH or player:hasCompletedMission(WOTG, CAIT_SITH)) then
            player:startEvent(55);
        end
    else
        player:startEvent(606);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 55) then
        player:setVar("BoyAndTheBeast",1);
    end
end;