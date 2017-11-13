-----------------------------------
-- Area: Caedarva Mire
-- NPC:  qm9
-- Involved in quest: The Wayward Automation
-- !pos  129 1.396 -631 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;

require("scripts/zones/Caedarva_Mire/TextIDs");
require("scripts/zones/Caedarva_Mire/MobIDs");

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
                player:startEvent(14);-- Event ID 14 for CS after toad
        else 
            if (not GetMobByID(Caedarva_Toad):isSpawned()) then
                SpawnMob(Caedarva_Toad):updateClaim(player); --Caedarva toad
            end;
        end;
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