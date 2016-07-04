-----------------------------------
--
-- Zone: Bibiki_Bay (4)
--
-----------------------------------
package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Bibiki_Bay/TextIDs");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 847, 70, DIGREQ_NONE },
                    { 887, 10, DIGREQ_NONE },
                    { 893, 55, DIGREQ_NONE },
                    { 17395, 110, DIGREQ_NONE },
                    { 738, 5, DIGREQ_NONE },
                    { 888, 160, DIGREQ_NONE },
                    { 4484, 60, DIGREQ_NONE },
                    { 17397, 110, DIGREQ_NONE },
                    { 641, 130, DIGREQ_NONE },
                    { 885, 30, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 1255, 10, DIGREQ_NONE }, -- all ores
                    { 845, 150, DIGREQ_BURROW },
                    { 843, 10, DIGREQ_BURROW },
                    { 844, 90, DIGREQ_BURROW },
                    { 1845, 10, DIGREQ_BURROW },
                    { 838, 10, DIGREQ_BURROW },
                    { 880, 70, DIGREQ_BORE },
                    { 902, 20, DIGREQ_BORE },
                    { 886, 30, DIGREQ_BORE },
                    { 867, 10, DIGREQ_BORE },
                    { 864, 40, DIGREQ_BORE },
                    { 1587, 50, DIGREQ_BORE },
                    { 1586, 30, DIGREQ_BORE },
                    { 866, 3, DIGREQ_BORE },
                    { 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 4532, 12, DIGREQ_MODIFIER },
                };

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

-----------------------------------
-- onChocoboDig
-----------------------------------
function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,481,-7,602,503,5,701);
    zone:registerRegion(2,-410,-7,-385,-383,5,-354);
    zone:registerRegion(3,487,-6,708,491,-1,717);
    zone:registerRegion(4,-394,-7,-396,-391,-1,-385);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    local bibiki = player:getVar("bibiki");

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        if ((prevZone == 3) and (bibiki == 3)) then
            cs = 0x000B;
        elseif ((prevZone ==3) and (bibiki == 4)) then
            cs = 0x000A;
        else
            player:setPos(669.917,-23.138,911.655,111);
        end
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
-- onRegionEnter
-----------------------------------

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

-----------------------------------
-- onRegionLeave
-----------------------------------

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

-----------------------------------
-- onTransportEvent
-----------------------------------
function onTransportEvent(player,transport)
    local bibiki=player:getVar("bibiki");

    if (bibiki == 1) then
        if (player:hasKeyItem(MANACLIPPER_TICKET)) then
            player:delKeyItem(MANACLIPPER_TICKET);
            player:startEvent(0x000E);
        elseif (player:hasKeyItem(MANACLIPPER_MULTITICKET)) then
            local remainingticket=player:getVar("Manaclipper_Ticket");
            player:setVar("Manaclipper_Ticket",(remainingticket - 1));
                if ( (remainingticket - 1) > 0) then
                    player:messageSpecial(LEFT_BILLET,0,MANACLIPPER_MULTITICKET,(remainingticket - 1));
                else
                    player:messageSpecial(END_BILLET,0,MANACLIPPER_MULTITICKET);
                    player:delKeyItem(MANACLIPPER_MULTITICKET);
                end
            player:startEvent(0x000E);
        else
            player:messageSpecial(NO_BILLET,MANACLIPPER_TICKET);
            player:setVar("bibiki",0);
            player:setPos(489,-3,713,200);
        end
    elseif (bibiki == 2) then
        player:startEvent(0x0010);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x000E) then
        player:setPos(0,0,0,0,3)
    elseif (csid == 0x000b) then
        player:startEvent(0x000d)
    elseif (csid == 0x0010) then
        player:setPos(0,0,0,0,3)
    elseif (csid == 0x000A) then
        player:startEvent(0x000c)
    end
end;