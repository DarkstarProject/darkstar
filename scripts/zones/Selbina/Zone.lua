-----------------------------------
--
-- Zone: Selbina (248)
--
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs");
require("scripts/globals/conquest");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    SetExplorerMoogles(ID.npc.EXPLORER_MOOGLE);
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        if (prevZone == dsp.zone.SHIP_BOUND_FOR_SELBINA) then
            cs = 202;
            player:setPos(32.500,-2.500,-45.500,192);
        else
            player:setPos(17.981,-16.806,99.83,64);
        end
    end

    if (player:hasKeyItem(dsp.ki.SEANCE_STAFF) and player:getVar("Enagakure_Killed") == 1) then
        cs = 1101;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onTransportEvent(player,transport)
    player:startEvent(200);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 200) then
        player:setPos(0,0,0,0,221);
    elseif (csid == 1101) then
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14226);
        else
            player:delKeyItem(dsp.ki.SEANCE_STAFF);
            player:addItem(14226);
            player:messageSpecial(ID.text.ITEM_OBTAINED,14226); -- Ninja Hakama
            player:setVar("Enagakure_Killed",0);
            player:setVar("illTakeTheBigBoxCS",0);
            player:addFame(NORG,30);
            player:completeQuest(OUTLANDS,I_LL_TAKE_THE_BIG_BOX);
        end
    end
end;
