-----------------------------------
-- Abyssea functions, vars, tables
-- DO NOT mess with the order
-- or change things to "elseif"!
-----------------------------------

require("scripts/globals/keyitems");

-- weaponskills for red weakness
local red_weakness = {
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

local yellow_weakness = {
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

local blue_weakness = {
    --6-14
    {196, 197, 198, 199, 212, 213, 214, 215, 18, 23, 24, 25, 118, 119, 120},
    --14-22
    {40, 41, 42, 135, 136, 71, 72, 103, 104, 87, 88, 151, 152, 55, 56},
    --22-6
    {165, 166, 167, 168, 169, 5, 6, 7, 8, 9, 176, 181, 182, 183, 184}
}

-----------------------------------
-- getMaxTravStones
-- returns Traverser Stone KI cap
-----------------------------------

function getMaxTravStones(player)
    local MaxTravStones = 3;
    if (player:hasKeyItem(VIRIDIAN_ABYSSITE_OF_AVARICE)) then
        MaxTravStones = MaxTravStones + 1;
    end
    if (player:hasKeyItem(IVORY_ABYSSITE_OF_AVARICE)) then
        MaxTravStones = MaxTravStones + 1;
    end
    if (player:hasKeyItem(VERMILLION_ABYSSITE_OF_AVARICE)) then
        MaxTravStones = MaxTravStones + 1;
    end
    return MaxTravStones;
end;

-----------------------------------
-- getTravStonesTotal
-- returns total Traverser Stone KI
-- (NOT the reserve value from currency menu)
-----------------------------------

function getTravStonesTotal(player)
    local STONES = 0;
    if (player:hasKeyItem(TRAVERSER_STONE1)) then
        STONES = STONES + 1;
    end
    if (player:hasKeyItem(TRAVERSER_STONE2)) then
        STONES = STONES + 1;
    end
    if (player:hasKeyItem(TRAVERSER_STONE3)) then
        STONES = STONES + 1;
    end
    if (player:hasKeyItem(TRAVERSER_STONE4)) then
        STONES = STONES + 1;
    end
    if (player:hasKeyItem(TRAVERSER_STONE5)) then
        STONES = STONES + 1;
    end
    if (player:hasKeyItem(TRAVERSER_STONE6)) then
        STONES = STONES + 1;
    end
    return STONES;
end;

-----------------------------------
-- spendTravStones
-- removes Traverser Stone KIs
-----------------------------------

function spendTravStones(player,spentstones)
    if (spentstones == 4) then
        if (player:hasKeyItem(TRAVERSER_STONE6)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE6);
        elseif (player:hasKeyItem(TRAVERSER_STONE5)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE5);
        elseif (player:hasKeyItem(TRAVERSER_STONE4)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE4);
        elseif (player:hasKeyItem(TRAVERSER_STONE3)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE3);
        elseif (player:hasKeyItem(TRAVERSER_STONE2)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE2);
        elseif (player:hasKeyItem(TRAVERSER_STONE1)) then
            spentstones = 3;
            player:delKeyItem(TRAVERSER_STONE1);
        end
    end
    if (spentstones == 3) then
        if (player:hasKeyItem(TRAVERSER_STONE6)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE6);
        elseif (player:hasKeyItem(TRAVERSER_STONE5)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE5);
        elseif (player:hasKeyItem(TRAVERSER_STONE4)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE4);
        elseif (player:hasKeyItem(TRAVERSER_STONE3)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE3);
        elseif (player:hasKeyItem(TRAVERSER_STONE2)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE2);
        elseif (player:hasKeyItem(TRAVERSER_STONE1)) then
            spentstones = 2;
            player:delKeyItem(TRAVERSER_STONE1);
        end
    end
    if (spentstones == 2) then
        if (player:hasKeyItem(TRAVERSER_STONE6)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE6);
        elseif (player:hasKeyItem(TRAVERSER_STONE5)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE5);
        elseif (player:hasKeyItem(TRAVERSER_STONE4)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE4);
        elseif (player:hasKeyItem(TRAVERSER_STONE3)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE3);
        elseif (player:hasKeyItem(TRAVERSER_STONE2)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE2);
        elseif (player:hasKeyItem(TRAVERSER_STONE1)) then
            spentstones = 1;
            player:delKeyItem(TRAVERSER_STONE1);
        end
    end
    if (spentstones == 1) then
        if (player:hasKeyItem(TRAVERSER_STONE6)) then
            player:delKeyItem(TRAVERSER_STONE6);
        elseif (player:hasKeyItem(TRAVERSER_STONE5)) then
            player:delKeyItem(TRAVERSER_STONE5);
        elseif (player:hasKeyItem(TRAVERSER_STONE4)) then
            player:delKeyItem(TRAVERSER_STONE4);
        elseif (player:hasKeyItem(TRAVERSER_STONE3)) then
            player:delKeyItem(TRAVERSER_STONE3);
        elseif (player:hasKeyItem(TRAVERSER_STONE2)) then
            player:delKeyItem(TRAVERSER_STONE2);
        elseif (player:hasKeyItem(TRAVERSER_STONE1)) then
            player:delKeyItem(TRAVERSER_STONE1);
        end
    end
end;

-----------------------------------
-- getAbyssiteTotal
-- returns total "Abyssite of <thing>"
-----------------------------------

function getAbyssiteTotal(player,Type)
    local SOJOURN = 0;
    local FURTHERANCE = 0;
    local MERIT = 0;
    if (Type == "SOJOURN") then
        if (player:hasKeyItem(IVORY_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        if (player:hasKeyItem(SCARLET_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        if (player:hasKeyItem(JADE_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        if (player:hasKeyItem(SAPPHIRE_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        if (player:hasKeyItem(INDIGO_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        if (player:hasKeyItem(EMERALD_ABYSSITE_OF_SOJOURN)) then
            SOJOURN = SOJOURN + 1;
        end
        return SOJOURN;
    elseif (Type == "FURTHERANCE") then
        if (player:hasKeyItem(SCARLET_ABYSSITE_OF_FURTHERANCE)) then
            FURTHERANCE = FURTHERANCE + 1;
        end
        if (player:hasKeyItem(SAPPHIRE_ABYSSITE_OF_FURTHERANCE)) then
            FURTHERANCE = FURTHERANCE + 1;
        end
        if (player:hasKeyItem(IVORY_ABYSSITE_OF_FURTHERANCE)) then
            FURTHERANCE = FURTHERANCE + 1;
        end
        return FURTHERANCE;
    elseif (Type == "MERIT") then
        if (player:hasKeyItem(AZURE_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        if (player:hasKeyItem(VIRIDIAN_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        if (player:hasKeyItem(JADE_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        if (player:hasKeyItem(SAPPHIRE_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        if (player:hasKeyItem(IVORY_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        if (player:hasKeyItem(INDIGO_ABYSSITE_OF_MERIT)) then
            MERIT = MERIT + 1;
        end
        return MERIT;
    end
end;

-----------------------------------
-- getDemiluneAbyssite
-- returns total value of Demulune KeyItems
-----------------------------------

function getDemiluneAbyssite(player)
    local Demilune = 0;
    -- Todo: change this into proper bitmask
    if (player:hasKeyItem(CLEAR_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 1;
    end
    if (player:hasKeyItem(COLORFUL_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 2;
    end
    if (player:hasKeyItem(SCARLET_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 4;
    end
    if (player:hasKeyItem(AZURE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 8;
    end
    if (player:hasKeyItem(VIRIDIAN_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 16;
    end
    if (player:hasKeyItem(JADE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 32;
    end
    if (player:hasKeyItem(SAPPHIRE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 64;
    end
    if (player:hasKeyItem(CRIMSON_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 128;
    end
    if (player:hasKeyItem(EMERALD_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 256;
    end
    if (player:hasKeyItem(VERMILLION_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 512;
    end
    if (player:hasKeyItem(INDIGO_DEMILUNE_ABYSSITE)) then
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
