-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: Runic Portal
-- Mamook Ja Teleporter Back to Aht Urgan Whitegate
-- !pos -211 -11 -818 52
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bhaflau_Thickets/TextIDs");
require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/globals/besieged");


function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(TOAU) == IMMORTAL_SENTRIES and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(111);
    elseif (player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then
        if (hasRunicPortal(player,3) == 1) then
            player:startEvent(109);
        else
            player:startEvent(111);
        end
    else
        player:messageSpecial(RESPONSE);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 111 and option == 1) then
        player:addNationTeleport(AHTURHGAN,8);
        dsp.teleport.toChamberOfPassage(player);
    elseif (csid == 109 and option == 1) then
        dsp.teleport.toChamberOfPassage(player);
    end

end;