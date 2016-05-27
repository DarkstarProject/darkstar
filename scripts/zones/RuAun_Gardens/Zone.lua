-----------------------------------
--
-- Zone: RuAun_Gardens (130)
--
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/conquest");
require("scripts/globals/zone");
require("scripts/zones/RuAun_Gardens/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17310100,17310101,17310102,17310103,17310104,17310105};

    SetFieldManual(manuals);

    -- Blue portal timers (2 minutes)
    -- counterclockwise
    SetServerVariable("Main-to-Seiryu-BlueTeleport",0);
    SetServerVariable("Seiryu-to-Genbu-BlueTeleport",0);
    SetServerVariable("Genbu-to-Byakko-BlueTeleport",0);
    SetServerVariable("Byakko-to-Suzaku-BlueTeleport",0);
    SetServerVariable("Suzaku-to-Main-BlueTeleport",0);
    -- clockwise
    SetServerVariable("Main-to-Suzaku-BlueTeleport",0);
    SetServerVariable("Suzaku-to-Byakko-BlueTeleport",0);
    SetServerVariable("Byakko-to-Genbu-BlueTeleport",0);
    SetServerVariable("Genbu-to-Seiryu-BlueTeleport",0);
    SetServerVariable("Seiryu-to-Main-BlueTeleport",0);

    ------------------------------
    -- Red teleports
    ------------------------------
    zone:registerRegion(1,-3,-54,-583,1,-50,-579);
    zone:registerRegion(2,147,-26,-449,151,-22,-445);
    zone:registerRegion(3,186,-43,-405,190,-39,-401);
    zone:registerRegion(4,272,-42,-379,276,-38,-375);
    zone:registerRegion(5,306,-39,-317,310,-35,-313);
    zone:registerRegion(6,393,-39,193,397,-35,197);
    zone:registerRegion(7,62,-39,434,66,-35,438);
    zone:registerRegion(8,-2,-42,464,2,-38,468);
    zone:registerRegion(9,-65,-39,434,-61,-35,438);
    zone:registerRegion(10,-397,-39,193,-393,-35,197);
    zone:registerRegion(11,-445,-42,142,-441,-38,146);
    zone:registerRegion(12,-276,-42,-379,-272,-38,-375);
    zone:registerRegion(13,-191,-43,-405,-187,-39,-401);
    zone:registerRegion(14,-151,-26,-449,-147,-22,-445);
    zone:registerRegion(15,543,-73,-19,547,-69,-15);
    zone:registerRegion(16,182,-73,511,186,-69,515);
    zone:registerRegion(17,-432,-73,332,-428,-69,336);
    zone:registerRegion(18,-453,-73,-308,-449,-69,-304);
    zone:registerRegion(19,-436,-39,71,-432,-35,75);
    zone:registerRegion(20,-310,-39,-317,-306,-35,-313);
    zone:registerRegion(21,441,-42,142,445,-38,146);
    zone:registerRegion(22,432,-39,71,436,-35,75);
    ------------------------------
    -- Blue teleports
    ------------------------------
    zone:registerRegion(23,162.5,-31,-353.5,168.5,-30,-347.5); -- Main To Seriyu
    zone:registerRegion(24,374.5,-25,61.5,380.5,-24,67.5); -- Seriyu to Genbu
    zone:registerRegion(25,52.5,-25,376.5,58.5,-24,382.5); -- Genbu to Byakko
    zone:registerRegion(26,-346.5,-25,166.5,-340.5,-24,172.5); -- Byakko to Suzaku
    zone:registerRegion(27,-270.5,-25,-277.5,-264.5,-24,-271.5); -- Suzaku to Main
    zone:registerRegion(28,-170,-31,-354.4,-162,-30,-347.2); -- Main to Suzaku
    zone:registerRegion(29,-381,-25,61.5,-374.5,-24,67.5); -- Suzaku to Byakko
    zone:registerRegion(30,-58,-25,376.5,-52,-24,382.5); -- Byakko to Genbu
    zone:registerRegion(31,340.5,-25,166.5,346.5,-24,172.5); --Genbu to Seriyu
    zone:registerRegion(32,264.5,-25,-277.5,270.5,-24,-271.5); -- Seriyu to Main
    ------------------------------
    -- Yellow teleports
    ------------------------------
    zone:registerRegion(33,454,-5,-149,456,-3,-147);
    zone:registerRegion(34,278,-5,383,281,-3,386);
    zone:registerRegion(35,-283,-5,386,-280,-3,389);
    zone:registerRegion(36,-456,-5,-149,-454,-3,-147);
    ---432,-72,335,-429,-70,333
    ------------------------------
    -- Green teleports
    ------------------------------
    zone:registerRegion(37,-145,-41,-156,-142,-39,-153);
    zone:registerRegion(38,142,-41,-156,145,-39,-153 );

    UpdateTreasureSpawnPoint(17310020);

    SetRegionalConquestOverseers(zone:getRegionID())
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

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(333.017,-44.896,-458.35,164);
    end
    if (player:getCurrentMission(ZILART) == THE_GATE_OF_THE_GODS and player:getVar("ZilartStatus") == 1) then
        cs = 0x0033;
    end

    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
    switch (region:GetRegionID()): caseof
    {
        ---------------------------------
        [1] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0000);
        end,
        ---------------------------------
        [2] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0001);
        end,
        ---------------------------------
        [3] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0002);
        end,
        ---------------------------------
        [4] = function (x)  -- Portal --
        ---------------------------------
            if (math.random(0,1) == 0) then
                player:startEvent(0x0004);
            else
                player:startEvent(0x0005);
            end
        end,
        ---------------------------------
        [5] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0006);
        end,
        ---------------------------------
        [6] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0009);
        end,
        ---------------------------------
        [7] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0010);
        end,
        ---------------------------------
        [8] = function (x)  -- Portal --
        ---------------------------------
            if (math.random(0,1) == 0) then
                player:startEvent(0x0012);
            else
                player:startEvent(0x0013);
            end
        end,
        ---------------------------------
        [9] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0014);
        end,
        ---------------------------------
        [10] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0017);
        end,
        ---------------------------------
        [11] = function (x)  -- Portal --
        ---------------------------------
            if (math.random(0,1) == 0) then
                player:startEvent(0x0019);
            else
                player:startEvent(0x001A);
            end
        end,
        ---------------------------------
        [12] = function (x)  -- Portal --
        ---------------------------------
            if (math.random(0,1) == 0) then
                player:startEvent(0x0020);
            else
                player:startEvent(0x0021);
            end
        end,
        ---------------------------------
        [13] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0022);
        end,
        ---------------------------------
        [14] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0024);
        end,
        ---------------------------------
        [15] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0025);
        end,
        ---------------------------------
        [16] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0026);
        end,
        ---------------------------------
        [17] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0027);
        end,
        ---------------------------------
        [18] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0028);
        end,
        ---------------------------------
        [19] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x001B);
        end,
        ---------------------------------
        [20] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x001E);
        end,
        ---------------------------------
        [21] = function (x)  -- Portal --
        ---------------------------------
            if (math.random(0,1) == 0) then
                player:startEvent(0x000B);
            else
                player:startEvent(0x000C);
            end
        end,
        ---------------------------------
        [22] = function (x)  -- Portal --
        ---------------------------------
            player:startEvent(0x0009);
        end,
        ----------- BLUE portals --------------
        ---------------------------------
        [23] = function (x)  -- Portal -- Main To Seriyu
        ---------------------------------
            if (GetNPCByID(17310054):getAnimation() == 8) then
                player:startEvent(0x0003);
            end
        end,
        ---------------------------------
        [24] = function (x)  -- Portal -- Seriyu to Genbu
        ---------------------------------
            if (GetNPCByID(17310057):getAnimation() == 8) then
                player:startEvent(0x000A);
            end
        end,
        ---------------------------------
        [25] = function (x)  -- Portal -- Genbu to Byakko
        ---------------------------------
            if (GetNPCByID(17310060):getAnimation() == 8) then
                player:startEvent(0x0011);
            end
        end,
        ---------------------------------
        [26] = function (x)  -- Portal -- Byakko to Suzaku
        ---------------------------------
            if (GetNPCByID(17310063):getAnimation() == 8) then
                player:startEvent(0x0018);
            end
        end,
        ---------------------------------
        [27] = function (x)  -- Portal -- Suzaku to Main
        ---------------------------------
            if (GetNPCByID(17310066):getAnimation() == 8) then
                player:startEvent(0x001F);
            end
        end,
        ---------------------------------
        [28] = function (x)  -- Portal -- Main to Suzaku
        ---------------------------------
            if (GetNPCByID(17310067):getAnimation() == 8) then
                player:startEvent(0x0023);
            end
        end,
        ---------------------------------
        [29] = function (x)  -- Portal -- Suzaku to Byakko
        ---------------------------------
            if (GetNPCByID(17310064):getAnimation() == 8) then
                player:startEvent(0x001C);
            end
        end,
        ---------------------------------
        [30] = function (x)  -- Portal -- Byakko to Genbu
        ---------------------------------
            if (GetNPCByID(17310061):getAnimation() == 8) then
                player:startEvent(0x0015);
            end
        end,
        ---------------------------------
        [31] = function (x)  -- Portal -- Genbu to Seriyu
        ---------------------------------
            if (GetNPCByID(17310058):getAnimation() == 8) then
                player:startEvent(0x000E);
            end
        end,
        ---------------------------------
        [32] = function (x)  -- Portal -- Seriyu to Main
        ---------------------------------
            if (GetNPCByID(17310055):getAnimation() == 8) then
                player:startEvent(0x0007);
            end
        end,
        ---------------------------------
        [33] = function (x)  -- Seiryu's Portal --
        ---------------------------------
            player:startEvent(0x0008);
        end,

        ---------------------------------
        [34] = function (x)  -- Genbu's Portal --
        ---------------------------------
            player:startEvent(0x000f);
        end,

        ---------------------------------
        [35] = function (x)  -- Byakko's Portal --
        ---------------------------------
            player:startEvent(0x0016);
        end,

        ---------------------------------
        [36] = function (x)  -- Suzaku's Portal --
        ---------------------------------
            player:startEvent(0x001d);
        end,

        ---------------------------------
        [37] = function (x)
        ---------------------------------
            if (player:getVar("skyShortcut") == 1) then
                player:startEvent(0x002a);
            else
                title = player:getTitle();
                if (title == 401) then
                    player:startEvent(0x0029,title);
                else
                    player:startEvent(0x002b,title);
                end
            end
        end,

        ---------------------------------
        [38] = function (x)
        ---------------------------------
            if (player:getVar("skyShortcut") == 1) then
                player:startEvent(0x002a);
            else
                title = player:getTitle();
                if (title == 401) then
                    player:startEvent(0x0029,title);
                else
                    player:startEvent(0x002b,title);
                end
            end
        end,

        default = function (x)
        end,
    }

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
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0029 and option ~= 0) then
        player:setVar("skyShortcut",1);
    elseif (csid == 0x0033) then
        player:setVar("ZilartStatus",0);
        player:completeMission(ZILART,THE_GATE_OF_THE_GODS);
        player:addMission(ZILART,ARK_ANGELS);
    end
end;
