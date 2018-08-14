-------------------------------------------------
--  Harvesting functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Harvesting
-------------------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/quests");

-------------------------------------------------
-- npcid and drop by zone
-------------------------------------------------

-- Zone, {npcid,npcid,npcid,..}
local npcid = {51, {16986725,16986726,16986727,16986728,16986729,16986730},  -- Wajaom Woodlands
               52, {16990607,16990608,16990609,16990610,16990611,16990612},  -- Bhaflau Thickets
               89, {17142545,17142546,17142547,17142548,17142549,17142550},  -- Grauberg [S]
               95, {17167162,17167163,17167164,17167165,17167166,17167167},  -- West Sarutabaruta [S]
               115,{17248839,17248840,17248841,17248842,17248843,17248844},  -- West Sarutabaruta
               123,{17281634,17281635,17281636},                             -- Yuhtunga Jungle
               124,{17285679,17285680,17285681},                             -- Yhoator Jungle
               145,{17371609,17371610,17371611,17371612,17371613,17371614},  -- Giddeus
               254,{17818220,17818221,17818222,17818223,17818224,17818225}}; -- Abyssea - Grauberg
-- Zone, {itemid,drop rate,itemid,drop rate,..}
-- Must be in ascending order by drop rate
local drop = {51, {1522,0.1880,2236,0.3410,2295,0.4700,2164,0.5990,4388,0.6930,2270,0.7750,2645,0.8460,2156,0.9170,1845,0.9760,1524,1.0000},
              52, {1522,0.1520,2295,0.3080,2164,0.4530,2236,0.5650,2156,0.6720,2270,0.7720,4388,0.8310,1845,0.8970,1524,0.9410,951,0.9730,2645,1.0000},
              89, {833,0.2320,1845,0.4310,573,0.5850,2155,0.6850,572,0.7850,5651,0.8980,575,1.0000},
              95, {1522,0.1670,833,0.3260,834,0.4900,5651,0.5800,1845,0.6610,835,0.7480,573,0.8050,1981,0.8610,1524,0.9020,1982,0.9350,572,0.9620,575,1.0000},
              115,{833,0.1760,1522,0.2840,834,0.3960,1845,0.5050,2713,0.6070,835,0.6970,1981,0.7470,4545,0.8020,635,0.8630,951,0.9010,573,0.9390,572,0.9620,839,0.9810,575,0.9920,1524,1.0000},
              123,{4373,0.4000,4375,0.6000,4374,0.8000,4447,0.8700,4448,0.9400,4386,0.9700,1983,1.0000},
              124,{4373,0.4000,4375,0.6000,4374,0.8000,4447,0.8700,4450,0.9400,4449,0.9700,1983,1.0000},
              145,{1845,0.1410,1522,0.2820,2713,0.4230,835,0.5430,834,0.6480,833,0.7320,635,0.7940,4545,0.8440,1982,0.8870,951,0.9260,575,0.9480,572,0.9650,1524,0.9760,839,0.9930,573,1.0000},
              254,{573,0.0991,575,0.2095,2155,0.3199,5444,0.4378,572,0.5595,5651,0.6850,1845,0.8331,833,1.0000}};
-- Define array of Colored Rocks, Do not reorder this array or rocks.
local rocks = {769,770,771,772,773,774,776,775};

function startHarvesting(player,zone,npc,trade,csid)
    if (trade:hasItemQty(1020,1) and trade:getItemCount() == 1) then
        local broke = sickleBreak(player,trade);
        local item = getHarvestingItem(player,zone);

        if (player:getFreeSlotsCount() == 0) then
            full = 1;
        else
            full = 0;
        end

        player:startEvent(csid,item,broke,full);

        if (item ~= 0 and full == 0) then
            player:addItem(item);
            SetServerVariable("[HARVESTING]Zone "..zone,GetServerVariable("[HARVESTING]Zone "..zone) + 1);
        end

        if (GetServerVariable("[HARVESTING]Zone "..zone) >= 3) then
            getNewHarvestingPositionNPC(player,npc,zone);
        end
        if (player:getQuestStatus(AHT_URHGAN,VANISHING_ACT) == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.RAINBOW_BERRY) == false and broke ~= 1 and zone == 51) then
           player:addKeyItem(dsp.ki.RAINBOW_BERRY);
           player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.RAINBOW_BERRY);
        end
    else
        player:messageSpecial(HARVESTING_IS_POSSIBLE_HERE,1020);
    end
end

-----------------------------------
-- Determine if Sickle breaks
-----------------------------------

function sickleBreak(player,trade)
    local broke = 0;
    local sicklebreak = math.random();

    sicklebreak = sicklebreak + (player:getMod(dsp.mod.HARVESTING_RESULT) / 1000);

    if (sicklebreak < HARVESTING_BREAK_CHANCE) then
        broke = 1;
        player:tradeComplete();
    end

    return broke;
end

-----------------------------------
-- Get an item
-----------------------------------

function getHarvestingItem(player,zone)
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

    if (Rate <= (1 - HARVESTING_RATE)) then
        item = 0;
    end

    return item;
end

-----------------------------------------
-- After 3 items he change the position
-----------------------------------------

function getNewHarvestingPositionNPC(player,npc,zone)
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
    SetServerVariable("[HARVESTING]Zone "..zone,0);
end