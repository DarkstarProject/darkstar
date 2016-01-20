-----------------------------------
-- Area: Caedarva Mire
-- NPC:  ??? 
-- @pos 456.993 -7.000 -270.815 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Caedarva_Mire/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local notMeantToBeProg = player:getVar("notmeanttobeCS");
    if (notMeantToBeProg == 1) then
        player:startEvent(0x0010);
    elseif (player:getQuestStatus(AHT_URHGAN,NOT_MEANT_TO_BE) == QUEST_ACCEPTED and notMeantToBeProg == 3) then
        player:startEvent(0x0011);
    elseif (player:getVar("notmeanttobeMoshdahnKilled") == 1 and player:getVar("notmeanttobeLamia27Killed") == 1) then
        player:startEvent(0x0012);
    else        
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
    if (csid == 0x0010) then
        player:setVar("notmeanttobeCS",2);
    elseif (csid == 0x0011) then
        if (GetMobAction(17101149) == 0 and GetMobAction(17101148) == 0) then
            SpawnMob(17101149):updateClaim(player);
            SpawnMob(17101148):updateClaim(player);
        end
    elseif (csid == 0x0012) then
        player:setVar("notmeanttobeMoshdahnKilled",0);
        player:setVar("notmeanttobeLamia27Killed",0);
        player:setVar("notmeanttobeCS",5);
    end
end;
