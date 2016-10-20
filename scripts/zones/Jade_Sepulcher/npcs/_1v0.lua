-----------------------------------
-- Area: Jade Sepulcher
-- NPC:  Ornamental Door
-- Involved in Missions: TOAU-29
-- @zone 299 0 -199 67
-----------------------------------
package.loaded["scripts/zones/Jade_Sepulcher/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/bcnm");
require("scripts/zones/Jade_Sepulcher/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(TOAU) == PUPPET_IN_PERIL and player:getVar("AhtUrganStatus") == 0) then
        player:startEvent(4);
    elseif (EventTriggerBCNM(player,npc)) then
        return;
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
    
    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
    
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);
    
    if (csid == 4) then
        player:setVar("AhtUrganStatus",1);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end
    
end;
