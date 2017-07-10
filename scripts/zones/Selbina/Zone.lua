-----------------------------------
--
-- Zone: Selbina (248)
--
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/zone");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    SetExplorerMoogles(17793131);

end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        if (prevZone == 220) then
            cs = 0x00ca;
            player:setPos(32.500,-2.500,-45.500,192);
        else
            player:setPos(17.981,-16.806,99.83,64);
        end
    end

    if (player:hasKeyItem(SEANCE_STAFF) and player:getVar("Enagakure_Killed") == 1) then
        cs = 0x044d;
    end

    return cs;
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
    player:startEvent(0x00c8);
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

    if (csid == 0x00c8) then
        player:setPos(0,0,0,0,221);
    elseif (csid == 0x044d) then
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14226);
        else
            player:delKeyItem(SEANCE_STAFF);
            player:addItem(14226);
            player:messageSpecial(ITEM_OBTAINED,14226); -- Ninja Hakama
            player:setVar("Enagakure_Killed",0);
            player:setVar("illTakeTheBigBoxCS",0);
            player:addFame(NORG,30);
            player:completeQuest(OUTLANDS,I_LL_TAKE_THE_BIG_BOX);
        end
    end

end;