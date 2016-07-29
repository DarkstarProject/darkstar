-----------------------------------
-- Area: Mount Zhayolm
--  NPC: Runic Portal
-- Mount Zhayolm Teleporter Back to Aht Urgan Whitegate
-- @pos 688 -23 349 61
-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mount_Zhayolm/TextIDs");
require("scripts/globals/teleports");
require("scripts/globals/besieged");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

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

    if (csid == 111 and option == 1) then
        player:addNationTeleport(AHTURHGAN,16);
        toChamberOfPassage(player);
    elseif (csid == 109 and option == 1) then
        toChamberOfPassage(player);
    end

end;