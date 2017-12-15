-----------------------------------
-- Area: Caedarva Mire
--  NPC: ???
-- !pos 456.993 -7.000 -270.815 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Caedarva_Mire/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local notMeantToBeProg = player:getVar("notmeanttobeCS");
    if (notMeantToBeProg == 1) then
        player:startEvent(16);
    elseif (player:getQuestStatus(AHT_URHGAN,NOT_MEANT_TO_BE) == QUEST_ACCEPTED and notMeantToBeProg == 3) then
        player:startEvent(17);
    elseif (player:getVar("notmeanttobeMoshdahnKilled") == 1 and player:getVar("notmeanttobeLamia27Killed") == 1) then
        player:startEvent(18);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 16) then
        player:setVar("notmeanttobeCS",2);
    elseif (csid == 17) then
        if (GetMobAction(17101149) == 0 and GetMobAction(17101148) == 0) then
            SpawnMob(17101149):updateClaim(player);
            SpawnMob(17101148):updateClaim(player);
        end
    elseif (csid == 18) then
        player:setVar("notmeanttobeMoshdahnKilled",0);
        player:setVar("notmeanttobeLamia27Killed",0);
        player:setVar("notmeanttobeCS",5);
    end
end;
