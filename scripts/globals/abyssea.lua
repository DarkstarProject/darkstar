-----------------------------------
-- Abyssea functions, vars, tables
-- DO NOT mess with the order
-- or change things to "elseif"!
-----------------------------------

require("scripts/globals/keyitems");

-- weaponskills for red weakness
local red_weakness =
{
    --light
    37, 161, 149, 180,
    --dark
    22, 133, 98,
    --fire
    34,
    --earth
    178,
    --wind
    20, 148,
    --ice
    51,
    --thunder
    144
}

local yellow_weakness =
{
    --fire
    [0] = { 146, 147, 176, 204, 591, 321, 455 },
    --earth
    [1] = { 161, 162, 191, 210, 555, 330, 458 },
    --water
    [2] = { 171, 172, 201, 515, 336, 454 },
    --wind
    [3] = { 156, 157, 186, 208, 534, 327, 457 },
    --ice
    [4] = { 151, 152, 181, 206, 531, 324, 456 },
    --ltng
    [5] = { 166, 167, 196, 212, 644, 333, 459 },
    --light
    [6] = { 29, 30, 38, 39, 21, 112, 565, 461 },
    --dark
    [7] = { 247, 245, 231, 260, 557, 348, 460 }
}

local blue_weakness =
{
    --6-14
    {196, 197, 198, 199, 212, 213, 214, 215, 18, 23, 24, 25, 118, 119, 120},
    --14-22
    {40, 41, 42, 135, 136, 71, 72, 103, 104, 87, 88, 151, 152, 55, 56},
    --22-6
    {165, 166, 167, 168, 169, 5, 6, 7, 8, 9, 176, 181, 182, 183, 184}
}

-- returns Traverser Stone KI cap
function getMaxTravStones(player)
    local MaxTravStones = 3

    for ki = dsp.ki.VIRIDIAN_ABYSSITE_OF_AVARICE, dsp.ki.VERMILLION_ABYSSITE_OF_AVARICE do
        if player:hasKeyItem(ki) then
            MaxTravStones = MaxTravStones + 1
        end
    end

    return MaxTravStones
end

-- returns total Traverser Stone KI
-- (NOT the reserve value from currency menu)
function getTravStonesTotal(player)
    local STONES = 0

    for ki = dsp.ki.TRAVERSER_STONE1, dsp.ki.TRAVERSER_STONE6 do
        if player:hasKeyItem(ki) then
            STONES = STONES + 1
        end
    end

    return STONES
end

-- removes Traverser Stone KIs
function spendTravStones(player, spentstones)
    if (spentstones == 4) then
        if (player:hasKeyItem(dsp.ki.TRAVERSER_STONE6)) then
            spentstones = 3;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE6);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE5)) then
            spentstones = 3;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE5);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE4)) then
            spentstones = 3;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE4);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE3)) then
            spentstones = 3;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE3);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE2)) then
            spentstones = 3;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE2);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE1)) then
            spentstones = 3;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE1);
        end
    end
    if (spentstones == 3) then
        if (player:hasKeyItem(dsp.ki.TRAVERSER_STONE6)) then
            spentstones = 2;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE6);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE5)) then
            spentstones = 2;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE5);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE4)) then
            spentstones = 2;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE4);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE3)) then
            spentstones = 2;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE3);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE2)) then
            spentstones = 2;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE2);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE1)) then
            spentstones = 2;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE1);
        end
    end
    if (spentstones == 2) then
        if (player:hasKeyItem(dsp.ki.TRAVERSER_STONE6)) then
            spentstones = 1;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE6);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE5)) then
            spentstones = 1;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE5);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE4)) then
            spentstones = 1;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE4);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE3)) then
            spentstones = 1;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE3);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE2)) then
            spentstones = 1;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE2);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE1)) then
            spentstones = 1;
            player:delKeyItem(dsp.ki.TRAVERSER_STONE1);
        end
    end
    if (spentstones == 1) then
        if (player:hasKeyItem(dsp.ki.TRAVERSER_STONE6)) then
            player:delKeyItem(dsp.ki.TRAVERSER_STONE6);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE5)) then
            player:delKeyItem(dsp.ki.TRAVERSER_STONE5);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE4)) then
            player:delKeyItem(dsp.ki.TRAVERSER_STONE4);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE3)) then
            player:delKeyItem(dsp.ki.TRAVERSER_STONE3);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE2)) then
            player:delKeyItem(dsp.ki.TRAVERSER_STONE2);
        elseif (player:hasKeyItem(dsp.ki.TRAVERSER_STONE1)) then
            player:delKeyItem(dsp.ki.TRAVERSER_STONE1);
        end
    end
end;

-- returns total "Abyssite of <thing>"
function getAbyssiteTotal(player, abyssite)
    local SOJOURN = 0
    local FURTHERANCE = 0
    local MERIT = 0
    if abyssite == "SOJOURN" then
        for ki = dsp.ki.IVORY_ABYSSITE_OF_SOJOURN, dsp.ki.EMERALD_ABYSSITE_OF_SOJOURN do
            if player:hasKeyItem(ki) then
                SOJOURN = SOJOURN + 1
            end
        end
        return SOJOURN
    elseif abyssite == "FURTHERANCE" then
        for ki = dsp.ki.SCARLET_ABYSSITE_OF_FURTHERANCE, dsp.ki.IVORY_ABYSSITE_OF_FURTHERANCE do
            if player:hasKeyItem(ki) then
                FURTHERANCE = FURTHERANCE + 1
            end
        end
        return FURTHERANCE
    elseif abyssite == "MERIT" then
        for ki = dsp.ki.AZURE_ABYSSITE_OF_MERIT, dsp.ki.INDIGO_ABYSSITE_OF_MERIT do
            if player:hasKeyItem(ki) then
                MERIT = MERIT + 1
            end
        end
        return MERIT
    end
end

-- returns total value of Demulune KeyItems
function getDemiluneAbyssite(player)
    local Demilune = 0;
    -- Todo: change this into proper bitmask
    if (player:hasKeyItem(dsp.ki.CLEAR_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 1;
    end
    if (player:hasKeyItem(dsp.ki.COLORFUL_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 2;
    end
    if (player:hasKeyItem(dsp.ki.SCARLET_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 4;
    end
    if (player:hasKeyItem(dsp.ki.AZURE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 8;
    end
    if (player:hasKeyItem(dsp.ki.VIRIDIAN_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 16;
    end
    if (player:hasKeyItem(dsp.ki.JADE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 32;
    end
    if (player:hasKeyItem(dsp.ki.SAPPHIRE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 64;
    end
    if (player:hasKeyItem(dsp.ki.CRIMSON_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 128;
    end
    if (player:hasKeyItem(dsp.ki.EMERALD_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 256;
    end
    if (player:hasKeyItem(dsp.ki.VERMILLION_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 512;
    end
    if (player:hasKeyItem(dsp.ki.INDIGO_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 1024;
    end
    return Demilune;
end;

function getNewYellowWeakness(mob)
    local day = VanadielDayElement()
    local weakness = math.random(day-1, day+1)
    if weakness < 0 then weakness = 7 elseif weakness > 7 then weakness = 0 end
    return yellow_weakness[weakness][math.random(#yellow_weakness[weakness])]
end

function getNewRedWeakness(mob)
    return red_weakness[math.random(#red_weakness)]
end

function getNewBlueWeakness(mob)
    local time = VanadielHour()
    local table = 3
    if time >= 6 and time < 14 then
        table = 1
    elseif time >= 14 and time < 22 then
        table = 2
    end
    return blue_weakness[table][math.random(#blue_weakness[table])]
end

-- [ZoneID] = {Required Trades Event, Has Key Items Event, Missing Key Item Event}
local POP_EVENTS =
{
    [15]  = {1010, 1020, 1021}, -- Abyssea-Konschtat
    [45]  = {1010, 1020, 1021}, -- Abyssea-Tahrongi
    [132] = {1010, 1020, 1021}, -- Abyssea-La Theine
    [215] = {1010, 1022, 1023}, -- Abyssea-Attohwa
    [216] = {1010, 1022, 1021}, -- Abyssea-Misareaux
    [217] = {1010, 1015, 1120}, -- Abyssea-Vunkerl
    [218] = {1010, 1020, 1021}, -- Abyssea-Altepa
    [253] = {1010, 1020, 1025}, -- Abyssea-Uleguerand
    [254] = {1010, 1020, 1021}, -- Abyssea-Grauberg
    [255] = {1010, 1020, 1021}, -- Abyssea-Empyreal Paradox
}

function abysseaOnTrade(player,npc,trade)
    -- validate QM pop data
    local zoneId = player:getZoneID()
    local pop = zones[zoneId].npc.QM_POPS[npc:getID()]
    if (pop == nil) then
        return false;
    end

    -- validate trade-to-pop
    local reqTrade = pop[2];
    if (#reqTrade == 0 or trade:getItemCount() ~= #reqTrade) then
        return false;
    end

    -- validate traded items
    for k, v in pairs(reqTrade) do
        if (not trade:hasItemQty(v,1)) then
            return false;
        end
    end

    -- validate nm status
    local nm = pop[4];
    if (GetMobByID(nm):isSpawned()) then
        return false;
    end

    -- complete trade and pop nm
    player:tradeComplete();
    local dx = player:getXPos() + math.random(-1,1);
    local dy = player:getYPos();
    local dz = player:getZPos() + math.random(-1,1);
    GetMobByID(nm):setSpawn(dx,dy,dz);
    SpawnMob(nm):updateClaim(player);
    return true;
end

function abysseaOnTrigger(player,npc)
    -- validate QM pop data
    local zoneId = player:getZoneID()
    local events = POP_EVENTS[zoneId]
    local pop = zones[zoneId].npc.QM_POPS[npc:getID()]
    if (pop == nil) then
        return false;
    end

    -- validate nm status
    local nm = pop[4];
    if (GetMobByID(nm):isSpawned()) then
        return false;
    end

    -- validate trade-to-pop
    local t = pop[2];
    if (#t > 0) then
        for i = 1, 8, 1 do
            if (t[i] == nil) then
                t[i] = 0;
            end
        end
        player:startEvent(events[1],t[1],t[2],t[3],t[4],t[5],t[6],t[7],t[8]); -- report required trades
        return true;
    end

    -- validate ki-to-pop
    local kis = pop[3];
    if (#kis == 0) then
        return false;
    end

    -- validate kis
    local validKis = true;
    for k, v in pairs(kis) do
        if (not player:hasKeyItem(v)) then
            validKis = false;
            break;
        end
    end

    -- infill kis
    for i = 1, 8, 1 do
        if (kis[i] == nil) then
            kis[i] = 0;
        end
    end

    -- start event
    if (validKis) then
        player:setLocalVar("abysseaQM", npc:getID());
        player:startEvent(events[2],kis[1],kis[2],kis[3],kis[4],kis[5],kis[6],kis[7],kis[8]); -- player has all key items
        return true;
    else
        player:startEvent(events[3],kis[1],kis[2],kis[3],kis[4],kis[5],kis[6],kis[7],kis[8]); -- player is missing key items
        return false;
    end
end

function abysseaOnEventUpdate(player,csid,option)
    return false;
end

function abysseaOnEventFinish(player,csid,option)
    local zoneId = player:getZoneID()
    local events = POP_EVENTS[zoneId]
    local pop = zones[zoneId].npc.QM_POPS[player:getLocalVar("abysseaQM")]
    player:setLocalVar("abysseaQM", 0);
    if (pop == nil) then
        return false;
    end

    if (csid == events[2] and option == 1) then
        -- delete kis
        local kis = pop[3];
        for k, v in pairs(kis) do
            if (player:hasKeyItem(v)) then
                player:delKeyItem(v);
            end
        end

        -- pop nm
        local nm = pop[4];
        local dx = player:getXPos() + math.random(-1,1);
        local dy = player:getYPos();
        local dz = player:getZPos() + math.random(-1,1);
        GetMobByID(nm):setSpawn(dx,dy,dz);
        SpawnMob(nm):updateClaim(player);
        return true;
    end
end
