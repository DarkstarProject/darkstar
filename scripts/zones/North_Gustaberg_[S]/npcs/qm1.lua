-----------------------------------
-- Area: North Gustaberg (S) (F-8)
--  NPC: ???
-- Involved in Quests
-- !pos -232 41 425
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg_[S]/TextIDs"] = nil;
package.loaded["scripts/globals/quests"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/North_Gustaberg_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR,BETTER_PART_OF_VALOR) == QUEST_ACCEPTED and player:getVar("BetterPartOfValProg") == 1) then
        player:startEvent(3);
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 3) then
        player:setVar("BetterPartOfValProg",2);
    end
end;
