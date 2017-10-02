-----------------------------------
-- Area: Jugner Forest
-- NPC:  ???
-- Involved in Quests: A Timely Visit
-- !pos -310 0 407 104
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Jugner_Forest/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)

    local ATimelyVisit = player:getQuestStatus(SANDORIA,A_TIMELY_VISIT);
    local ATimelyVisitProgress = player:getVar("ATimelyVisitProgress");
    local Time = VanadielHour();


    if (Time >= 18 or Time < 6) then
        if (ATimelyVisit == 1 and ATimelyVisitProgress == 9) then
            SpawnMob(17203666,300):updateEnmity(player);
            SpawnMob(17203667,300):updateEnmity(player);
        elseif (ATimelyVisit == 1 and ATimelyVisitProgress == 10) then
            player:startEvent(0x0012);
        else
            player:messageSpecial(NOTHING_HAPPENS);
        end;
    else
        if (ATimelyVisit == 1 and ATimelyVisitProgress == 10) then
            player:startEvent(0x0012);
        else    
            player:messageSpecial(NOTHING_HAPPENS);
        end;    
    end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);

    if (csid == 0x0012) then
        player:setVar("ATimelyVisitProgress",11);
    end;
end;