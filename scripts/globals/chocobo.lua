-------------------------------------------------
--  Author: santssoft
--  Chocobo functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Chocobo_Renter
--      http://ffxi.allakhazam.com/wiki/Traveling_in_Vana'diel
-------------------------------------------------

require("scripts/globals/settings");

--[[-----------------------------------------------
Description:
    chocobo = Zone, { [1] Lowest price, [2] Amount added to base price, [3] Amount discounted per time interval, [4] Amount of seconds before price decay, [5] Quest "A Chocobo Riding Game" chance }
--]]-----------------------------------------------

chocobo = {230,{100,20,5,60,0.10},  -- Southern San d'Oria
           234,{100,20,5,60,0.10},  -- Bastok Mines
           241,{100,20,5,60,0.10},  -- Windurst Woods
           244,{200,25,5,90,0.00},  -- Upper Jeuno
           245,{200,25,5,90,0.00},  -- Lower Jeuno
           246,{200,25,5,90,0.00},  -- Port Jeuno
           250,{ 90,10,5,60,0.10},  -- Kazham
           252,{ 90,10,5,60,0.00},  -- Norg
           247,{ 90,10,5,60,0.00},  -- Rabao
           102,{200,25,5,90,0.00},  -- La Theine Plateau
           108,{200,25,5,90,0.00},  -- Konschtat Highlands
           117,{200,25,5,90,0.00},  -- Tahrongi Canyon
           114,{200,25,5,90,0.00},  -- Eastern Altepa Desert
           124,{200,25,5,90,0.00},  -- Yhoator Jungle
            48,{250,25,5,90,0.00},  -- Al Zahbi
            51,{200,20,5,90,0.00},  -- Wajaom Woodlands
            80,{150,20,5,90,0.00},  -- Southern San d'Oria [S]
            87,{150,20,5,90,0.00},  -- Bastok Markets [S]
            94,{150,20,5,90,0.00},  -- Windurst Waters [S]
            82,{200,25,5,90,0.00},  -- Jugner Forest [S]
            90,{200,25,5,90,0.00},  -- Pashhow Marshlands [S]
            97,{200,25,5,90,0.00}}; -- Meriphataud Mountains [S]

---------------------------------------
-- Set chocobo Prices on server start
---------------------------------------

function setChocoboPrices()
    for u = 1, table.getn(chocobo), 2 do
        SetServerVariable("[CHOCOBO]["..chocobo[u].."]Price", chocobo[u + 1][1]);
        SetServerVariable("[CHOCOBO]["..chocobo[u].."]Time", os.time(t));
    end
end;

---------------------------------------
-- return chocobo Price
---------------------------------------

function getChocoboPrice(player)
    local zone = player:getZone();
    local price = 0;

    for u = 1, table.getn(chocobo), 2 do
        if(chocobo[u] == zone) then
            local last_price = GetServerVariable("[CHOCOBO]["..zone.."]Price");
            local last_time = GetServerVariable("[CHOCOBO]["..zone.."]Time");

            price = last_price - (math.floor((os.time(t) - last_time) / chocobo[u + 1][4]) * chocobo[u + 1][3]);

            if (price < chocobo[u + 1][1]) then
                price = chocobo[u + 1][1];
            end
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
        if(chocobo[u] == zone) then
            SetServerVariable("[CHOCOBO]["..chocobo[u].."]Price", price + chocobo[u + 1][2]);
            SetServerVariable("[CHOCOBO]["..chocobo[u].."]Time", os.time(t));
        end
    end
end;