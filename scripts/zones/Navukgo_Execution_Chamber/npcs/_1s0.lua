-----------------------------------
-- Area: Navukgo Execution Chamber
-- NPC:  Decorative Bronze Gate
-- Involved in Missions: TOAU-22
-- @zone -601 10 -100 64
-----------------------------------
package.loaded["scripts/zones/Navukgo_Execution_Chamber/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/zones/Navukgo_Execution_Chamber/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == SHIELD_OF_DIPLOMACY and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(2);
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

    if (csid == 2) then
        player:setVar("AhtUrganStatus", 2);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;
