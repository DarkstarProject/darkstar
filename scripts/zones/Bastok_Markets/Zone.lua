-----------------------------------
--
-- Zone: Bastok_Markets (235)
--
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/chocobo");
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    applyHalloweenNpcCostumes(zone:getID())

    setChocoboPrices();
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    -- FIRST LOGIN (START CS)
    if (player:getPlaytime(false) == 0) then
        if (OPENING_CUTSCENE_ENABLE == 1) then
            --cs = 0x00;
        end
        player:setPos(-280,-12,-91,15);
        player:setHomePoint();
    end
    -- MOG HOUSE EXIT
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        position = math.random(1,5) - 33;
        player:setPos(-177,-8,position,127);
        if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
            cs = 0x7534;
        end
        player:setVar("PlayerMainJob",0);
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
end;

-----------------------------------
-- onGameDay
-----------------------------------

function onGameDay()
    -- Removes daily the bit mask that tracks the treats traded for Harvest Festival.
    if (isHalloweenEnabled() ~= 0) then
        clearVarFromAll("harvestFestTreats");
        clearVarFromAll("harvestFestTreats2");
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

    if (csid == 0x00) then
        player:messageSpecial(ITEM_OBTAINED,0x218);
    elseif (csid == 0x7534 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(HOMEPOINT_SET);
    end
end;