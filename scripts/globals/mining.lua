-------------------------------------------------
--  Author: Ezekyel
--  Mining functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Mining
-------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-------------------------------------------------
-- npcid and drop by zone
-------------------------------------------------

-- Zone, {npcid,npcid,npcid,..}
local npcid = {11,{16822521,16822522,16822523,16822524,16822525,16822526},   -- Oldton Movalpolos
         12,{16826617,16826618,16826619,16826620,16826621,16826622},   -- Newton Movalpolos
         61,{17027549,17027550,17027551,17027552,17027553,17027554},   -- Mount Zhayolm
         62,{17031711,17031712,17031713,17031714,17031715,17031716},   -- Halvung
         88,{17138511,17138512,17138513,17138514,17138515,17138516},   -- North Gustaberg [S]
         142,{17359049,17359050,17359051,17359052,17359053,17359054},  -- Yughott Grotto
         143,{17363360,17363361,17363362,17363363,17363364,17363365},  -- Palborough Mines
         172,{17481834,17481835,17481836,17481837,17481838,17481839},  -- Zeruhn Mines
         196,{17580393,17580394,17580395,17580396,17580397,17580398},  -- Gusgen Mines
         205,{17617221,17617222,17617223,17617224,17617225,17617226}}; -- Ifrit's Cauldron
-- Zone, {itemid,drop rate,itemid,drop rate,..}
local drop = {11,{0x0676,0.1155,0x0282,0.2300,0x0280,0.3415,0x0281,0.4530,0x02E0,0.5595,0x0283,0.6590,0x0660,0.7285,0x0659,0.7930,0x0666,0.8525,0x0238,0.9100,0x065F,0.9676,0x0285,0.9762,0x0284,0.9848,0x02E1,0.9924,0x02E2,1.0000},
        12,{0x0280,0.2020,0x0281,0.3590,0x0282,0.4690,0x0676,0.6340,0x02E0,0.6900,0x02A6,0.6972,0x0283,0.9192,0x0285,0.9278,0x0284,0.9364,0x02E1,0.9924,0x02E2,1.0000},
        61,{0x0454,0.1763,0x0483,0.3256,0x0283,0.4629,0x03A0,0.5742,0x0300,0.7055,0x065F,0.7368,0x0660,0.8451,0x0659,0.9181,0x0666,0.9332,0x0870,0.9546,0x0871,0.9680,0x0386,0.9870,0x0286,0.9950,0x02AD,1.0000},
        62,{0x03A0,0.0725,0x0454,0.1740,0x0483,0.3605,0x0300,0.5190,0x0659,0.5445,0x0660,0.5980,0x0666,0.6045,0x065F,0.6300,0x0870,0.6744,0x0871,0.7088,0x0971,0.9532,0x02E1,0.9876,0x02E3,0.9940,0x08B4,1.0000},
        88,{0x0280,0.1860,0x0282,0.3780,0x0281,0.5270,0x4390,0.6600,0x02E0,0.7450,0x0283,0.8620,0x0284,0.9360,0x0666,0.9570,0x0659,0.9680,0x0660,0.9790,0x065F,0.9840,0x02E2,1.0000},
        142,{0x0280,0.1790,0x0283,0.3700,0x0281,0.5190,0x4390,0.6400,0x0282,0.7840,0x0300,0.8740,0x02E0,0.9280,0x0301,0.9530,0x0285,0.9830,0x02E1,1.0000},
        143,{0x0282,0.1620,0x0283,0.3180,0x4390,0.4650,0x0281,0.6020,0x0284,0.7280,0x02E0,0.8460,0x0280,0.9620,0x02E2,1.0000},
        172,{0x4390,0.2070,0x0282,0.3761,0x0280,0.5252,0x0281,0.6703,0x0283,0.8134,0x02E0,0.9115,0x0285,0.9546,0x0301,0.9917,0x02E1,1.0000},
        196,{0x4390,0.2071,0x0282,0.3762,0x0280,0.5253,0x0281,0.6704,0x0283,0.8135,0x02E0,0.9116,0x0285,0.9547,0x0301,0.9918,0x02E1,1.0000},
        205,{0x0300,0.2200,0x0283,0.4400,0x0454,0.6600,0x43A4,0.7300,0x03A0,0.7900,0x0483,0.8500,0x0286,0.8800,0x0285,0.9100,0x084E,0.9400,0x02E3,0.9700,0x0301,1.0000}};
-- Define array of Colored Rocks, Do not reorder this array or rocks.
local rocks = {0x0301,0x0302,0x0303,0x0304,0x0305,0x0306,0x0308,0x0307};

function startMining(player,zone,npc,trade,csid)
    if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then

        broke = pickaxeBreak(player,trade);
        item = getMiningItem(player,zone);

        if (player:getFreeSlotsCount() == 0) then
            full = 1;
        else
            full = 0;
        end

        player:startEvent(csid,item,broke,full);

        if (item ~= 0 and full == 0) then
            player:addItem(item);
            SetServerVariable("[MINING]Zone "..zone,GetServerVariable("[MINING]Zone "..zone) + 1);
        end

        if (GetServerVariable("[MINING]Zone "..zone) >= 3) then
            getNewMiningPositionNPC(player,npc,zone);
        end
    else
        player:messageSpecial(MINING_IS_POSSIBLE_HERE,605);
    end
end

-----------------------------------
-- Determine if Pickaxe breaks
-----------------------------------

function pickaxeBreak(player,trade)
    local broke = 0;
    local pickaxebreak = math.random();

    pickaxebreak = pickaxebreak + (player:getMod(MOD_MINNING_RESULT) / 1000);

    if (pickaxebreak < MINING_BREAK_CHANCE) then
        broke = 1;
        player:tradeComplete();
    end

    return broke;

end

-----------------------------------
-- Get an item
-----------------------------------

function getMiningItem(player,zone)
    local Rate = math.random();

    for zon = 1, table.getn(drop), 2 do
        if (drop[zon] == zone) then
            for itemlist = 1, table.getn(drop[zon + 1]), 2 do
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

    if (Rate <= (1 - MINING_RATE)) then
        item = 0;
    end

    return item;
end

-----------------------------------------
-- After 3 items he change the position
-----------------------------------------

function getNewMiningPositionNPC(player,npc,zone)
    local newnpcid = npc:getID();

    for u = 1, table.getn(npcid), 2 do
        if (npcid[u] == zone) then
            nbNPC = table.getn(npcid[u + 1]);
            while newnpcid == npc:getID() do
                newnpcid = math.random(1,nbNPC);
                newnpcid = npcid[u + 1][newnpcid];
            end
            break;
        end
    end

    npc:setStatus(2);
    GetNPCByID(newnpcid):setStatus(0);
    SetServerVariable("[MINING]Zone "..zone,0);
end