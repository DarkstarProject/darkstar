-------------------------------------------------
--    Excavation functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Excavation
-------------------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/settings");

-------------------------------------------------
-- npcid and drop by zone
-------------------------------------------------

-- Zone, {npcid,npcid,npcid,..}
local npcid = {7,{16806369,16806370,16806371,16806372,16806373,16806374},    -- Attohwa Chasm
         68,{17056388,17056389,17056390},                               -- Aydeewa Subterrane
         117,{17257055,17257056,17257057,17257058,17257059,17257060},  -- Tahrongi Canyon
         173,{17486253,17486254,17486255,17486256,17486257,17486258},  -- Korroloka Tunnel
         198,{17588774,17588775,17588776,17588777,17588778,17588779}}; -- Maze of Shakhrami
-- Zone, {itemid,drop rate,itemid,drop rate,..}
local drop = {7,{880,0.2220,898,0.4440,891,0.5660,17396,0.6880,897,0.7600,896,0.8320,2503,0.8740,1236,0.9160,1473,0.9580,769,1.0000},
        68,{},
        117,{880,0.2820,898,0.4840,891,0.6160,893,0.7660,17396,0.8870,897,0.9270,896,0.9550,885,0.9830,1888,1.0000},
        173,{936,0.1820,888,0.3170,881,0.3570,864,0.5390,17395,0.7210,17397,0.8560,887,0.8680,573,0.8800,885,0.9200,575,0.9600,1985,1.0000},
        198,{880,0.3060,891,0.4870,17396,0.6680,893,0.7870,897,0.8430,896,0.8990,703,0.9220,769,0.9440,1888,1.0000}};
-- Define array of Colored Rocks, Do not reorder this array or rocks.
local rocks = {769,770,771,772,773,774,776,775};

function startExcavation(player,zone,npc,trade,csid)

    if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then

        broke = pickaxeBreakEx(player,trade);
        item = getExcavationItem(player,zone);

        if (player:getFreeSlotsCount() == 0) then
            full = 1;
        else
            full = 0;
        end

        player:startEvent(csid,item,broke,full);

        if (item ~= 0 and full == 0) then
            player:addItem(item);
            SetServerVariable("[EXCAVATION]Zone "..zone,GetServerVariable("[EXCAVATION]Zone "..zone) + 1);
        end

        if (GetServerVariable("[EXCAVATION]Zone "..zone) >= 3) then
            getNewExcavationPositionNPC(player,npc,zone);
        end

        if (broke ~= 1 and player:getQuestStatus(AHT_URHGAN,OLDUUM) == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.ELECTROCELL) == false and player:hasKeyItem(dsp.ki.ELECTROPOT) == false and player:hasKeyItem(dsp.ki.ELECTROLOCOMOTIVE) == false and zone == 68) then
            local randPick = math.random(0,2);

            if randPick == 1 then
                player:addKeyItem(dsp.ki.ELECTROCELL);
                player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ELECTROCELL);
            elseif randPick == 2 then
                player:addKeyItem(dsp.ki.ELECTROPOT);
                player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ELECTROPOT);
            else
                player:addKeyItem(dsp.ki.ELECTROLOCOMOTIVE);
                player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ELECTROLOCOMOTIVE);

            end
        end
    else
        player:messageSpecial(MINING_IS_POSSIBLE_HERE,605);
    end

end

-----------------------------------
-- Determine if Pickaxe breaks
-----------------------------------

function pickaxeBreakEx(player,trade)

    local broke = 0;
    pickaxebreak = math.random();

    if (pickaxebreak < EXCAVATION_BREAK_CHANCE) then
        broke = 1;
        player:tradeComplete();
    end

    return broke;

end

-----------------------------------
-- Get an item
-----------------------------------

function getExcavationItem(player,zone)

    Rate = math.random();

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
    -- Determine result if Colored Rock
    --------------------

    if (item == 769) then
        day = VanadielDayElement();
        item = rocks[day + 1];
    end

    --------------------
    -- Determine chance of no item mined
    -- Default rate is 50%
    --------------------

    Rate = math.random();

    if (Rate <= (1 - EXCAVATION_RATE)) then
        item = 0;
    end

    return item;

end

-----------------------------------------
-- After 3 items he change the position
-----------------------------------------

function getNewExcavationPositionNPC(player,npc,zone)

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
    SetServerVariable("[EXCAVATION]Zone "..zone,0);
end