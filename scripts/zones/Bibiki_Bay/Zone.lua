-----------------------------------
--
-- Zone: Bibiki_Bay (4)
--
-----------------------------------
local ID = require("scripts/zones/Bibiki_Bay/IDs");
require("scripts/globals/chocobo_digging");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/zone");
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end;

function onInitialize(zone)
    zone:registerRegion(1,481,-7,602,503,5,701);
    zone:registerRegion(2,-410,-7,-385,-383,5,-354);
    zone:registerRegion(3,487,-6,708,491,-1,717);
    zone:registerRegion(4,-394,-7,-396,-391,-1,-385);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    local bibiki = player:getVar("bibiki");

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        if ((prevZone == dsp.zone.MANACLIPPER) and (bibiki == 3)) then
            cs = 11;
        elseif ((prevZone == dsp.zone.MANACLIPPER) and (bibiki == 4)) then
            cs = 10;
        else
            player:setPos(669.917,-23.138,911.655,111);
        end
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)
            player:setVar("bibiki",1);
        end,

        [2] = function (x)
            player:setVar("bibiki",2);
        end,

        [3] = function (x)
            player:setVar("bibiki",0);
        end,

        [4] = function (x)
            player:setVar("bibiki",0);
        end,
    }
end;

function onRegionLeave(player,region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)
            player:setVar("bibiki",3);
        end,

        [2] = function (x)
            player:setVar("bibiki",4);
        end,
    }
end;

function onTransportEvent(player,transport)
    local bibiki=player:getVar("bibiki");

    if (bibiki == 1) then
        if (player:hasKeyItem(dsp.ki.MANACLIPPER_TICKET)) then
            player:delKeyItem(dsp.ki.MANACLIPPER_TICKET);
            player:startEvent(14);
        elseif (player:hasKeyItem(dsp.ki.MANACLIPPER_MULTITICKET)) then
            local remainingticket=player:getVar("Manaclipper_Ticket");
            player:setVar("Manaclipper_Ticket",(remainingticket - 1));
                if ( (remainingticket - 1) > 0) then
                    player:messageSpecial(ID.text.LEFT_BILLET,0,dsp.ki.MANACLIPPER_MULTITICKET,(remainingticket - 1));
                else
                    player:messageSpecial(ID.text.END_BILLET,0,dsp.ki.MANACLIPPER_MULTITICKET);
                    player:delKeyItem(dsp.ki.MANACLIPPER_MULTITICKET);
                end
            player:startEvent(14);
        else
            player:messageSpecial(ID.text.NO_BILLET,dsp.ki.MANACLIPPER_TICKET);
            player:setVar("bibiki",0);
            player:setPos(489,-3,713,200);
        end
    elseif (bibiki == 2) then
        player:startEvent(16);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 14) then
        player:setPos(0,0,0,0,3)
    elseif (csid == 11) then
        player:startEvent(13)
    elseif (csid == 16) then
        player:setPos(0,0,0,0,3)
    elseif (csid == 10) then
        player:startEvent(12)
    end
end;
