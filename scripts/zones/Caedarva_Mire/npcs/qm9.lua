-----------------------------------
-- Area: Caedarva Mire
-- NPC:  qm9
-- Involved in quest: The Wayward Automation
-- !pos  129 1.396 -631 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;

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

        local TheWaywardAutomation = player:getQuestStatus(AHT_URHGAN,THE_WAYWARD_AUTOMATION);
        local TheWaywardAutomationProgress = player:getVar("TheWaywardAutomationProgress");
        
        if (TheWaywardAutomation == 1 and TheWaywardAutomationProgress == 2) then
            if (player:getVar("TheWaywardAutomationNM") >= 1) then
                if (GetMobAction(17101145) == 0) then
                    player:startEvent(14);-- Event ID 14 for CS after toad
                end
            else 
                SpawnMob(17101145):updateClaim(player); --Caedarva toad
            end
        else
            player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end;
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
    
        if (csid == 14) then
            player:setVar("TheWaywardAutomationProgress",3);
            player:setVar("TheWaywardAutomationNM",0);
        end;
end;