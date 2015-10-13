-------------------------------------------------
--  Chocobo functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Chocobo_Renter
--      http://ffxi.allakhazam.com/wiki/Traveling_in_Vana'diel
-------------------------------------------------

require("scripts/globals/settings");

--[[-----------------------------------------------
Description:
    chocobo = Zone, { [1] Base price, [2] Amount added to base price, [3] Amount discounted per time interval, [4] Amount of seconds before price decay, [5] Quest "A Chocobo Riding Game" chance }
--]]-----------------------------------------------

local chocobo = {230,{baseprice = 100,addedprice = 20,decayprice = 5,decaytime = 60,questchance = 0.10},  -- Southern San d'Oria
                 234,{baseprice = 100,addedprice = 20,decayprice = 5,decaytime = 60,questchance = 0.10},  -- Bastok Mines
                 241,{baseprice = 100,addedprice = 20,decayprice = 5,decaytime = 60,questchance = 0.10},  -- Windurst Woods
                 244,{baseprice = 200,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Upper Jeuno
                 245,{baseprice = 200,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Lower Jeuno
                 246,{baseprice = 200,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Port Jeuno
                 250,{baseprice =  90,addedprice = 10,decayprice = 5,decaytime = 60,questchance = 0.10},  -- Kazham
                 252,{baseprice =  90,addedprice = 10,decayprice = 5,decaytime = 60,questchance = 0.00},  -- Norg
                 247,{baseprice =  90,addedprice = 10,decayprice = 5,decaytime = 60,questchance = 0.00},  -- Rabao
                 102,{baseprice = 200,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00},  -- La Theine Plateau
                 108,{baseprice = 200,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Konschtat Highlands
                 117,{baseprice = 200,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Tahrongi Canyon
                 114,{baseprice = 200,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Eastern Altepa Desert
                 124,{baseprice = 200,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Yhoator Jungle
                  48,{baseprice = 250,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Al Zahbi
                  51,{baseprice = 200,addedprice = 20,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Wajaom Woodlands
                  80,{baseprice = 150,addedprice = 20,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Southern San d'Oria [S]
                  87,{baseprice = 150,addedprice = 20,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Bastok Markets [S]
                  94,{baseprice = 150,addedprice = 20,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Windurst Waters [S]
                  82,{baseprice = 200,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Jugner Forest [S]
                  90,{baseprice = 200,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00},  -- Pashhow Marshlands [S]
                  97,{baseprice = 200,addedprice = 25,decayprice = 5,decaytime = 90,questchance = 0.00}}; -- Meriphataud Mountains [S]

---------------------------------------
-- Set chocobo Prices on server start
---------------------------------------

function setChocoboPrices()
    for u = 1, table.getn(chocobo), 2 do
        SetServerVariable("[CHOCOBO]["..chocobo[u].."]Price", chocobo[u + 1].baseprice);
        SetServerVariable("[CHOCOBO]["..chocobo[u].."]Time", os.time(t));
    end
end;

---------------------------------------
-- return chocobo Price
---------------------------------------

function getChocoboPrice(player)
    local zone = player:getZoneID();
    local price = 0;

    for u = 1, table.getn(chocobo), 2 do
        if (chocobo[u] == zone) then
            local last_price = GetServerVariable("[CHOCOBO]["..zone.."]Price");
            local last_time = GetServerVariable("[CHOCOBO]["..zone.."]Time");

            price = last_price - (math.floor((os.time(t) - last_time) / chocobo[u + 1].decaytime) * chocobo[u + 1].decayprice);

            if (price < chocobo[u + 1].baseprice) then
                price = chocobo[u + 1].baseprice;
            end

            break;
        end
    end

    return price;
end

---------------------------------------
-- update chocobo Price
---------------------------------------

function updateChocoboPrice(player, price)
    local zone = player:getZoneID();

    for u = 1, table.getn(chocobo), 2 do
        if (chocobo[u] == zone) then
            SetServerVariable("[CHOCOBO]["..chocobo[u].."]Price", price + chocobo[u + 1].addedprice);
            SetServerVariable("[CHOCOBO]["..chocobo[u].."]Time", os.time(t));

            break;
        end
    end
end;