-----------------------------------
--
-- Zone: Grand_Palace_of_HuXzoi (34)
--
-----------------------------------
package.loaded["scripts/zones/Grand_Palace_of_HuXzoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Grand_Palace_of_HuXzoi/TextIDs");
require("scripts/zones/Grand_Palace_of_HuXzoi/MobIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,  -102, -4,  541,  -97, 4, 546); -- elvaan tower L-6  52??
    zone:registerRegion(2,  737, -4,  541,  742, 4, 546); -- elvaan tower L-6  52??
    zone:registerRegion(3,  661, -4,  87,  667, 4, 103);
    zone:registerRegion(4,  -178, -4,  97,  -173, 4, 103);
    zone:registerRegion(5,  340, -4,  97,  347, 4, 102);
    zone:registerRegion(6,  -497, -4,  97,  -492, 4, 102);
    zone:registerRegion(7,  97, -4,  372,  103, 4, 378);
    zone:registerRegion(8,  -742, -4,  372,  -736, 4, 379);
    zone:registerRegion(9,  332, -4,  696,  338, 4, 702);
    zone:registerRegion(10,  -507, -4,  697,  -501, 4, 702);
    
    -- Give Temperance a random PH
    local JoT_PH = math.random(1,5);
    SetServerVariable("[SEA]Jailer_of_Temperance_PH", Jailer_of_Temperance_PH[JoT_PH]);
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
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-20,-1.5,-355.482,192);
    end

    player:setVar("Hu-Xzoi-TP",0);

    return cs;
end;

-----------------------------------
-- afterZoneIn
-----------------------------------

function afterZoneIn(player)
    player:entityVisualPacket("door");
    player:entityVisualPacket("dtuk");
    player:entityVisualPacket("2dor");
    player:entityVisualPacket("cryq");
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
    if (player:getVar("Hu-Xzoi-TP") == 0 and player:getAnimation() == 0) then -- prevent 2cs at same time
        switch (region:GetRegionID()): caseof
        {
            [1] = function (x) player:startEvent(0x0097); end,
            [2] = function (x) player:startEvent(0x009c); end,
            [3] = function (x) player:startEvent(0x009D); end,
            [4] = function (x) player:startEvent(0x0098); end,
            [5] = function (x) player:startEvent(0x009E); end,
            [6] = function (x) player:startEvent(0x0099); end,
            [7] = function (x) player:startEvent(0x009F); end,
            [8] = function (x) player:startEvent(0x009A); end,
            [9] = function (x) player:startEvent(0x009B); end,
            [10] = function (x) player:startEvent(0x0096); end,
        }
    end
end;
-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid >0x0095 and csid < 0x00A0) then
        player:setVar("Hu-Xzoi-TP",1);
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid >0x0095 and csid < 0x00A0) then
        player:setVar("Hu-Xzoi-TP",0);
    end
end;

-----------------------------------
-- onGameHour
-----------------------------------

function onGameHour(npc, mob, player)
    local VanadielHour = VanadielHour();
    
    if (VanadielHour % 6 == 0) then    -- Change the Jailer of Temperance PH every 6 hours (~15 mins).
        JoT_ToD = GetServerVariable("[SEA]Jailer_of_Temperance_POP");
        if (GetMobAction(Jailer_of_Temperance) == 0 and JoT_ToD <= os.time(t)) then -- Don't want to set a PH if it's already up; also making sure it's been 15 mins since it died last
            local JoT_PH = math.random(1,5);
            SetServerVariable("[SEA]Jailer_of_Temperance_PH", Jailer_of_Temperance_PH[JoT_PH]);
        end
    end
end;