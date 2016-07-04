-----------------------------------
--
-- Zone: Sacrarium (28)
--
-----------------------------------
package.loaded["scripts/zones/Sacrarium/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/zones/Sacrarium/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    -- Set random variable for determining Old Prof. Mariselle's spawn location
    local rand = math.random((2),(7));
    SetServerVariable("Old_Prof_Spawn_Location", rand);

    UpdateTreasureSpawnPoint(16892179);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-219.996,-18.587,82.795,64);
    end
    -- ZONE LEVEL RESTRICTION
    if (ENABLE_COP_ZONE_CAP == 1) then
        player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);
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
    -- Labyrinth
    local day = VanadielDayElement() ;
    local tbl;
    local SacrariumWallOffset = 16892109;

    if (day == 3 or day == 7) then
        tbl = {9,9,8,8,9,9,8,9,8,8,9,8,8,8,9,8,9,8};
    elseif (day == 1 or day == 5) then
        tbl = {9,9,8,9,8,8,8,8,9,9,9,8,9,8,8,8,8,9};
    elseif (day == 0 or day == 4) then
        tbl = {8,9,8,9,8,9,9,8,9,9,8,8,9,8,8,8,8,9};
    else
        tbl = {9,8,9,9,8,9,8,8,9,8,8,9,8,9,8,9,8,8};
    end

    GetNPCByID(SacrariumWallOffset):setAnimation(tbl[1]);
    GetNPCByID(SacrariumWallOffset+6):setAnimation(tbl[2]);
    GetNPCByID(SacrariumWallOffset+12):setAnimation(tbl[3]);
    GetNPCByID(SacrariumWallOffset+13):setAnimation(tbl[4]);
    GetNPCByID(SacrariumWallOffset+1):setAnimation(tbl[5]);
    GetNPCByID(SacrariumWallOffset+7):setAnimation(tbl[6]);
    GetNPCByID(SacrariumWallOffset+14):setAnimation(tbl[7]);
    GetNPCByID(SacrariumWallOffset+2):setAnimation(tbl[8]);
    GetNPCByID(SacrariumWallOffset+8):setAnimation(tbl[9]);
    GetNPCByID(SacrariumWallOffset+9):setAnimation(tbl[10]);
    GetNPCByID(SacrariumWallOffset+3):setAnimation(tbl[11]);
    GetNPCByID(SacrariumWallOffset+15):setAnimation(tbl[12]);
    GetNPCByID(SacrariumWallOffset+16):setAnimation(tbl[13]);
    GetNPCByID(SacrariumWallOffset+10):setAnimation(tbl[14]);
    GetNPCByID(SacrariumWallOffset+4):setAnimation(tbl[15]);
    GetNPCByID(SacrariumWallOffset+17):setAnimation(tbl[16]);
    GetNPCByID(SacrariumWallOffset+11):setAnimation(tbl[17]);
    GetNPCByID(SacrariumWallOffset+5):setAnimation(tbl[18]);
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
end;