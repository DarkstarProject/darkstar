-----------------------------------
-- Area: Mount Zhayolm
--  NPC: Runic Portal
-- Mount Zhayolm Teleporter Back to Aht Urgan Whitegate
-- !pos 688 -23 349 61
-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mount_Zhayolm/TextIDs");
require("scripts/globals/teleports");
require("scripts/globals/besieged");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(TOAU) == IMMORTAL_SENTRIES and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(111);
    elseif (player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then
        if (hasRunicPortal(player,4) == 1) then
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
        player:addNationTeleport(AHTURHGAN,16);
        dsp.teleport.toChamberOfPassage(player);
    elseif (csid == 109 and option == 1) then
        dsp.teleport.toChamberOfPassage(player);
    end

end;