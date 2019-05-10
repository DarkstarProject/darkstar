-----------------------------------
-- Area: Cloister of Frost
-- NPC:  Ice Protocrystal
-- Involved in Quests: Trial by Ice, Trial Size Trial by Ice
-- !pos 558 0 596 203
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
local ID = require("scripts/zones/Cloister_of_Frost/IDs");

function onTrade(player,npc,trade)

    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end

end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ASA) == dsp.mission.id.asa.SUGAR_COATED_DIRECTIVE and player:getVar("ASA4_Azure") == 1) then
        player:startEvent(2);
    elseif (EventTriggerBCNM(player,npc)) then
        return;
    else
        player:messageSpecial(ID.text.PROTOCRYSTAL);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);

    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end

end;

function onEventFinish(player,csid,option)
    --printf("onFinish CSID: %u",csid);
    --printf("onFinish RESULT: %u",option);

    if (csid==2) then
        player:delKeyItem(dsp.ki.DOMINAS_AZURE_SEAL);
        player:addKeyItem(dsp.ki.AZURE_COUNTERSEAL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.AZURE_COUNTERSEAL);
        player:setVar("ASA4_Azure","2");
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;