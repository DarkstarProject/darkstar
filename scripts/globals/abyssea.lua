-----------------------------------
-- Abyssea functions, vars, tables
-- DO NOT mess with the order
-- or change things to "elseif"!
-----------------------------------

require("scripts/globals/keyitems");


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
