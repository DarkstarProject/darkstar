-------------------------------------------------
--  Logging functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Logging
-------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-------------------------------------------------
-- npcid and drop by zone
-------------------------------------------------

-- Zone, {npcid,npcid,npcid,..}
local npcid = {2,  {16785773,16785774,16785775,16785776},                   -- Carpenter's Landing
               24, {16875883,16875884,16875885,16875886,16875887,16875888}, -- Lufaise Meadows
               25, {16879972,16879973,16879974,16879975,16879976,16879977}, -- Misareaux Coast
               65, {17044014,17044015,17044016,17044017,17044018,17044019}, -- Mamook
               79, {17101318,17101319,17101320,17101321,17101322,17101323}, -- Caedarva Mire
               81, {17109782,17109783,17109784,17109785,17109786,17109787}, -- East Ronfaure [S]
               82, {17113901,17113902,17113903,17113904,17113905,17113906}, -- Jugner Forest [S]
               96, {17171239,17171240,17171241,17171242,17171243,17171244}, -- Fort Karugo-Narugo [S]
               101,{17191530,17191531,17191532,17191533,17191534,17191535}, -- East Ronfaure
               104,{17203864,17203865,17203866,17203867,17203868,17203869}, -- Jugner Forest
               118,{17261175,17261176,17261177,17261178,17261179,17261180}, -- Buburimu Peninsula
               123,{17281630,17281631,17281632,17281633,17281634,17281635}, -- Yuhtunga Jungle
               124,{17285675,17285676,17285677,17285678,17285679,17285680}, -- Yhoator Jungle
               140,{17350974,17350975,17350976,17350977}};                  -- Ghelsba Outpost
-- Zone, {itemid,drop rate,itemid,drop rate,..}
-- Must be in ascending order by drop rate
local drop = {2,  {4504,0.0900,688,0.1800,698,0.2700,923,0.3600,695,0.4500,693,0.7050,696,0.9600,699,1.0000},
              24, {693,0.0950,4363,0.1900,688,0.4400,691,0.6900,698,0.9400,690,0.9600,699,0.9800,4504,1.0000},
              25, {688,0.4000,693,0.4700,691,0.5400,4363,0.7400,698,0.9400,690,0.9600,699,0.9800,4504,1.0000},
              65, {5566,0.2300,2213,0.4600,694,0.5100,702,0.5600,689,0.6100,701,0.6590,2503,0.7660,727,0.8730,688,0.9800,729,1.0000},
              79, {729,0.0392,694,0.0944,702,0.1666,701,0.2388,688,0.3590,2213,0.4952,689,0.6474,2503,0.8156,727,1.0000},
              81, {2534,0.0030,2532,0.0330,699,0.0660,574,0.1110,693,0.1740,694,0.2640,639,0.3810,698,0.5130,5661,0.6450,691,0.7950,688,1.0000},
              82, {688,0.1800,698,0.3600,693,0.5400,695,0.7200,699,0.7700,2532,0.8200,4504,0.9000,5661,0.9800,2534,1.0000},
              96, {18175,0.0040,1236,0.0240,847,0.1630,4570,0.3140,5662,0.4810,5650,0.7080,4154,1.0000},
              101,{694,0.0500,696,0.1130,574,0.1760,694,0.2640,691,0.4760,688,0.7380,698,1.0000},
              104,{699,0.0120,4504,0.0600,923,0.1320,698,0.2590,688,0.4220,695,0.5970,696,0.7900,693,1.0000},
              118,{700,0.0170,701,0.0430,702,0.0770,574,0.1290,923,0.2070,697,0.3020,4503,0.4050,4445,0.5600,688,0.7580,689,1.0000},
              123,{688,0.2350,721,0.4650,1192,0.0500,689,0.7000,697,0.7700,940,0.8400,912,0.9100,701,0.9400,702,0.9700,1237,1.0000},
              124,{702,0.0120,5908,0.0340,732,0.0560,731,0.0780,1192,0.1160,700,0.1180,940,0.1580,923,0.2280,912,0.3730,689,0.5440,688,0.7620,721,0.9800,1237,1.0000},
              140,{697,0.0530,690,0.1060,695,0.2050,691,0.4400,698,0.6950,688,1.0000}};

function startLogging(player,zone,npc,trade,csid)
    if (trade:hasItemQty(1021,1) and trade:getItemCount() == 1) then
        local broke = hatchetBreak(player,trade);
        local item = getLoggingItem(player,zone);

        if (player:getFreeSlotsCount() == 0) then
            full = 1;
        else
            full = 0;
        end

        player:startEvent(csid,item,broke,full);

        if (item ~= 0 and full == 0) then
            player:addItem(item);
            SetServerVariable("[LOGGING]Zone "..zone,GetServerVariable("[LOGGING]Zone "..zone) + 1);
        end

        if (GetServerVariable("[LOGGING]Zone "..zone) >= 3) then
            getNewLoggingPositionNPC(player,npc,zone);
        end
    else
        player:messageSpecial(LOGGING_IS_POSSIBLE_HERE,1021);
    end
end

-----------------------------------
-- Determine if Hatchet breaks
-----------------------------------

function hatchetBreak(player,trade)
    local broke = 0;
    local hatchetbreak = math.random();

    hatchetbreak = hatchetbreak + (player:getMod(dsp.mod.LOGGING_RESULT) / 1000);

    if (hatchetbreak < LOGGING_BREAK_CHANCE) then
        broke = 1;
        player:tradeComplete();
    end

    return broke;

end

-----------------------------------
-- Get an item
-----------------------------------

function getLoggingItem(player,zone)
    local Rate = math.random();

    for zon = 1, #drop, 2 do
        if (drop[zon] == zone) then
            for itemlist = 1, #drop[zon + 1], 2 do
                if (Rate <= drop[zon + 1][itemlist + 1]) then
                    item = drop[zon + 1][itemlist];
                    break;
                end
            end
            break;
        end
    end

    --------------------
    -- Determine chance of no item mined
    -- Default rate is 50%
    --------------------

    Rate = math.random();

    if (Rate <= (1 - LOGGING_RATE)) then
        item = 0;
    end

    return item;
end

-----------------------------------------
-- After 3 items he change the position
-----------------------------------------

function getNewLoggingPositionNPC(player,npc,zone)
    local newnpcid = npc:getID();

    for u = 1, #npcid, 2 do
        if (npcid[u] == zone) then
            nbNPC = #npcid[u + 1];
            while newnpcid == npc:getID() do
                newnpcid = math.random(1,nbNPC);
                newnpcid = npcid[u + 1][newnpcid];
            end
            break;
        end
    end

    npc:setStatus(2);
    GetNPCByID(newnpcid):setStatus(0);
    SetServerVariable("[LOGGING]Zone "..zone,0);
end