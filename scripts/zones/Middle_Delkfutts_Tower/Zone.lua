-----------------------------------
--
-- Zone: Middle_Delkfutts_Tower
--
-----------------------------------
package.loaded["scripts/zones/Middle_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Middle_Delkfutts_Tower/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, -36, -50, 83,  -30, -49,  89 ); -- Fourth Floor G-6 porter to Lower Delkfutt's Tower
    zone:registerRegion(2, -49, -50, -50, -43, -49, -43 ); -- Fourth Floor G-6 porter to Lower Delkfutt's Tower "1"
    zone:registerRegion(3, 103, -50, 10,  109, -49,  16 ); -- Fourth Floor J-6 porter to Lower Delkfutt's Tower "2"
    zone:registerRegion(4,  83,  -82, -48, 89, -81, -43 ); -- Sixth Floor J-10 porter to Seventh Floor "H"
    zone:registerRegion(5, -49, -82, -48, -43, -81, -43 ); -- Sixth Floor F-10 porter to Seventh Floor "G"
    zone:registerRegion(6,  84,  -82, 83,  89, -81,  89 ); -- Sixth Floor J-6 porter to Seventh Floor "I"
    zone:registerRegion(7, -489, -98, -48, -483, -97, -43 ); -- Seventh Floor F-10 porter to Sixth Floor "G"
    zone:registerRegion(8, -356, -98, -48, -351, -97, -43 ); -- Seventh Floor J-10 porter to Sixth Floor "H"
    zone:registerRegion(9, -356, -98, 84, -351, -97,  88 ); -- Seventh Floor  J-6 porter to Sixth Floor "I"
    zone:registerRegion(10, -415, -98, 104, -411, -97, 108 ); -- Seventh Floor  H-6 porter to Sixth Floor "J"
    zone:registerRegion(11, -489, -130, 84, -484,-129, 88 ); -- Ninth Floor F-6 porter to Upper Delkfutt's Tower

    UpdateTreasureSpawnPoint(17420676);
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

return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)

    switch (region:GetRegionID()): caseof
    {
        ---------------------------------
        [1] = function (x)
        ---------------------------------
        player:startEvent(0);
        end,

        ---------------------------------
        [2] = function (x)
        ---------------------------------
        player:startEvent(1);
        end,

        ---------------------------------
        [3] = function (x)
        ---------------------------------
        player:startEvent(2);
        end,

        ---------------------------------
        [4] = function (x)
        ---------------------------------
        player:startEvent(5);
        end,

        ---------------------------------
        [5] = function (x)
        ---------------------------------
        player:startEvent(3);
        end,

        ---------------------------------
        [6] = function (x)
        ---------------------------------
        if (player:getQuestStatus(BASTOK,BLADE_OF_EVIL) == QUEST_ACCEPTED and player:getFreeSlotsCount() >= 1 and player:getVar("bladeOfEvilCS") == 1) then
            player:startEvent(0x000e);
        else
            player:startEvent(7);
        end

        end,

        --------------------------------
        [7] = function (x)
        ---------------------------------
        player:startEvent(4);
        end,

        ---------------------------------
        [8] = function (x)
        ---------------------------------
        player:startEvent(6);
        end,

        ---------------------------------
        [9] = function (x)
        ---------------------------------
        player:startEvent(8);
        end,

        ---------------------------------
        [10] = function (x)
        ---------------------------------
        player:startEvent(9);
        end,

        ---------------------------------
        [11] = function (x)
        ---------------------------------
        player:startEvent(0xA);
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
--print("onUpdateCSID: ",csid);
--print("onUpdateRESULT: ",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--print("onFinishCSID: ",csid);
--print("onFinishRESULT: ",option);

    if (csid <= 11 and option == 1) then
        if (csid == 0) then
            player:setPos(412, -32, 80, 100, 184);
        elseif (csid == 1) then
            player:setPos(388, -32, -40, 231, 184);
        elseif (csid == 2) then
            player:setPos(540, -32, 20, 128, 184);
        elseif (csid == 0xA) then
            player:setPos(-355, -144, 91, 64, 158);
        end
    elseif (csid == 0x000e) then
        player:addItem(12516);
        player:messageSpecial(ITEM_OBTAINED,12516); -- Chaos Burgeonet
        player:addTitle(PARAGON_OF_DARK_KNIGHT_EXCELLENCE);
        player:setVar("bladeOfEvilCS",0);
        player:addFame(BASTOK,AF3_FAME);
        player:completeQuest(BASTOK,BLADE_OF_EVIL);
    end

end;