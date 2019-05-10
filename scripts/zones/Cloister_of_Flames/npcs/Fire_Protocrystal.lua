-----------------------------------
-- Area: Cloister of Flames
-- NPC:  Fire Protocrystal
-- Involved in Quests: Trial by Fire, Trial Size Trial by Fire
-- !pos -721 0 -598 207
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
local ID = require("scripts/zones/Cloister_of_Flames/IDs");

function onTrade(player,npc,trade)

    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end

end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ASA) == dsp.mission.id.asa.SUGAR_COATED_DIRECTIVE and player:getVar("ASA4_Scarlet") == 1) then
        player:startEvent(2);
    elseif (EventTriggerBCNM(player,npc)) then
        return;
    else
        player:messageSpecial(ID.text.PROTOCRYSTAL);
    end

end;

function onEventUpdate(player,csid,option)
    --printf("onUpdate CSID: %u",csid);
    --printf("onUpdate RESULT: %u",option);

    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end

end;

function onEventFinish(player,csid,option)
    --printf("onFinish CSID: %u",csid);
    --printf("onFinish RESULT: %u",option);

    if (csid==2) then
        player:delKeyItem(dsp.ki.DOMINAS_SCARLET_SEAL);
        player:addKeyItem(dsp.ki.SCARLET_COUNTERSEAL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SCARLET_COUNTERSEAL);
        player:setVar("ASA4_Scarlet","2");
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;