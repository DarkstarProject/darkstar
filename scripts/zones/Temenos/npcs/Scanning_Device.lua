-----------------------------------
-- Area: Temenos
-- NPC:  Scanning_Device
-- !pos 586 0 66 37
-----------------------------------
require("scripts/globals/limbus")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if not player:battlefieldAtCapacity(1299) then
        SetServerVariable("[1299]Time", 0)
    end
    if not player:battlefieldAtCapacity(1300) then
        SetServerVariable("[1300]Time", 0)
    end
    if not player:battlefieldAtCapacity(1298) then
        SetServerVariable("[1298]Time", 0)
    end
    if not player:battlefieldAtCapacity(1306) then
        SetServerVariable("[1306]Time", 0)
    end
    if not player:battlefieldAtCapacity(1305) then
        SetServerVariable("[1305]Time", 0)
    end
    if not player:battlefieldAtCapacity(1304) then
        SetServerVariable("[1304]Time", 0)
    end
    if not player:battlefieldAtCapacity(1303) then
        SetServerVariable("[1303]Time", 0)
    end
    if not player:battlefieldAtCapacity(1301) then
        SetServerVariable("[1301]Time", 0)
    end
    player:startEvent(121, 511)
end

function onEventUpdate(player, csid, option)
    local time = 0
    switch (option): caseof {
        [1] = function() time = GetServerVariable("[1299]Time") end, -- Northern Tower
        [2] = function() time = GetServerVariable("[1300]Time") end, -- Eastern Tower
        [3] = function() time = GetServerVariable("[1298]Time") end, -- Western Tower
        [4] = function() time = GetServerVariable("[1306]Time") end, -- Central 4th
        [5] = function() time = GetServerVariable("[1305]Time") end, -- Central 3rd
        [6] = function() time = GetServerVariable("[1304]Time") end, -- Central 2nd
        [7] = function() time = GetServerVariable("[1303]Time") end, -- Central 1st
        [8] = function() time = GetServerVariable("[1301]Time") end, -- Central Basement
    }
    player:updateEvent(0, time, 0, 0, 0, 0, 0, 0)
end

function onEventFinish(player, csid, option)
end
