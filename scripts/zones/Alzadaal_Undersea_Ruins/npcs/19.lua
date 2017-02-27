-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- NPC:  19 (no name)
-----------------------------------
package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Alzadaal_Undersea_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == PATH_OF_DARKNESS and player:getVar("AhtUrganStatus") == 0) then
        player:startEvent(6);
    elseif (player:getCurrentMission(TOAU) == NASHMEIRAS_PLEA and player:getVar("AhtUrganStatus") == 0) then
        player:startEvent(8);
    else
        player:messageSpecial(DEVICE_MALFUNCTIONING);
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

    if (csid == 6) then
        player:setVar("AhtUrganStatus", 1);
    elseif (csid == 8) then
        player:setVar("AhtUrganStatus", 1);
    end
end;
