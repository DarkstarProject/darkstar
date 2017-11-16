-- Functions below used in quest: Bait and Switch
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");

BnS_KILN = 1;
BnS_REFINERY = 2;
BnS_REPLICA = 3;

function CheckBaitProgress(player)
    local scope = 0;
    local harp = 0;
    local id = 0;
    local snares = 0;
    local charm = 0;
    local watch = 0;
    local costume = 0;

    if (player:getMaskBit(player:getVar("Bait_and_Switch_Quest_Progress"),0) == false) then
        scope = 1;
    end
    if (player:getMaskBit(player:getVar("Bait_and_Switch_Quest_Progress"),1) == false) then
        harp = 1;
    end
    if (player:getMaskBit(player:getVar("Bait_and_Switch_Quest_Progress"),2) == false) then
        id = 1;
    end
    if (player:getMaskBit(player:getVar("Bait_and_Switch_Quest_Progress"),3) == false) then
        snares = 1;
    end
    if (player:getMaskBit(player:getVar("Bait_and_Switch_Quest_Progress"),4) == false) then
        charm = 1;
    end
    if (player:getMaskBit(player:getVar("Bait_and_Switch_Quest_Progress"),5) == false) then
        watch = 1;
    end
    if (player:getMaskBit(player:getVar("Bait_and_Switch_Quest_Progress"),6) == false) then
        costume = 1;
    end

    local ProgressCheck = {scope,harp,id,snares,charm,watch,costume};
    return ProgressCheck;
end;

function CheckSnares(player)
    local kilnSnare = 0;
    local shopSnare = 0;
    local refinerySnare = 0;
    local replicaSnare = 0;
    local gunpowderSnare = 0;
    local cidSnare = 0;
    local snareNumber = 0;

    if (player:getMaskBit(player:getLocalVar("Bait_and_Switch_Quest_Option"),9) == true) then
        kilnSnare = 1;
    end
    if (player:getMaskBit(player:getLocalVar("Bait_and_Switch_Quest_Option"),10) == true) then
        shopSnare = 1;
    end
    if (player:getMaskBit(player:getLocalVar("Bait_and_Switch_Quest_Option"),11) == true) then
        refinerySnare = 1;
    end
    if (player:getMaskBit(player:getLocalVar("Bait_and_Switch_Quest_Option"),12) == true) then
        replicaSnare = 1;
    end
    if (player:getMaskBit(player:getLocalVar("Bait_and_Switch_Quest_Option"),13) == true) then
        gunpowderSnare = 1;
    end
    if (player:getMaskBit(player:getLocalVar("Bait_and_Switch_Quest_Option"),14) == true) then
        cidSnare = 1;
    end

    local SnareCheck = {kilnSnare,shopSnare,refinerySnare,replicaSnare,gunpowderSnare,cidSnare};
    for i,v in ipairs(SnareCheck) do
        if (v == 1) then
            snareNumber = snareNumber + 1;
        end
    end
    local SnareCheckfin = {kilnSnare,shopSnare,refinerySnare,replicaSnare,gunpowderSnare,cidSnare,snareNumber};
    return SnareCheckfin;
end;

function RecordBaitProgress(player)
    local BitConvert = {0,1,2,3,4,5,6};
    local ChosenItem = CheckOptionForItem(player);
    local Progress = player:getVar("Bait_and_Switch_Quest_Progress");
    player:setMaskBit(Progress,"Bait_and_Switch_Quest_Progress",BitConvert[ChosenItem],true);
end;

function CheckOptionForItem(player)
    local OptionCheck = 0;
    if (player:getLocalVar("Bait_and_Switch_Quest_Option") == 1) then
        OptionCheck = 1;
    elseif (player:getLocalVar("Bait_and_Switch_Quest_Option") == 2) then
        OptionCheck = 2;
    elseif (player:getLocalVar("Bait_and_Switch_Quest_Option") == 3) then
        OptionCheck = 3;
    elseif (player:getLocalVar("Bait_and_Switch_Quest_Option") == 0) then
        OptionCheck = 4;
    elseif (player:getLocalVar("Bait_and_Switch_Quest_Option") == 4 or
            player:getLocalVar("Bait_and_Switch_Quest_Option") == 5 or
            player:getLocalVar("Bait_and_Switch_Quest_Option") == 6) then
        OptionCheck = 5;
    elseif (player:getLocalVar("Bait_and_Switch_Quest_Option") == 7) then
        OptionCheck = 6;
    elseif (player:getLocalVar("Bait_and_Switch_Quest_Option") == 8) then
        OptionCheck = 7;
    elseif (player:getLocalVar("Bait_and_Switch_Quest_Option") >= 512) then
        OptionCheck = 4;
    end
    return OptionCheck;
end;

local S = 1;
local M = 2;
local L = 3;

Switch_Table =
{
-- Scope
    [101] = {ord = {S,M,L},snake = 3,helmut = 0,wolf = 2,darha = 1,digits = 3},
    [102] = {ord = {S,L,M},snake = 2,helmut = 0,wolf = 3,darha = 1,digits = 3},
    [103] = {ord = {M,S,L},snake = 3,helmut = 0,wolf = 1,darha = 2,digits = 3},
    [104] = {ord = {M,L,S},snake = 1,helmut = 0,wolf = 3,darha = 2,digits = 3},
    [105] = {ord = {L,S,M},snake = 2,helmut = 0,wolf = 1,darha = 3,digits = 3},
    [106] = {ord = {L,M,S},snake = 1,helmut = 0,wolf = 2,darha = 3,digits = 3},
-- Bard's Harp
    [201] = {ord = {S,M,L,M},snake = 2,helmut = 2,wolf = 1,darha = 1,digits = 4},
    [202] = {ord = {S,M,L,L},snake = 3,helmut = 3,wolf = 1,darha = 1,digits = 4},
    [203] = {ord = {S,L,M,M},snake = 2,helmut = 2,wolf = 2,darha = 1,digits = 4},
    [204] = {ord = {S,L,M,L},snake = 3,helmut = 3,wolf = 2,darha = 1,digits = 4},
    [205] = {ord = {M,S,L,S},snake = 1,helmut = 1,wolf = 3,darha = 2,digits = 4},
    [206] = {ord = {M,L,S,S},snake = 1,helmut = 1,wolf = 4,darha = 2,digits = 4},
    [207] = {ord = {M,L,S,L},snake = 3,helmut = 3,wolf = 4,darha = 2,digits = 4},
    [208] = {ord = {L,S,M,S},snake = 1,helmut = 1,wolf = 5,darha = 3,digits = 4},
    [209] = {ord = {L,M,S,S},snake = 1,helmut = 1,wolf = 6,darha = 3,digits = 4},
    [210] = {ord = {L,M,S,M},snake = 2,helmut = 2,wolf = 6,darha = 3,digits = 4},
-- Lead Guardsman's ID
    [301] = {ord = {L,M,S,S,M,L},snake = 3,helmut = 1,wolf = 1,darha = 3,digits = 6},
    [302] = {ord = {S,L,M,M,S,L},snake = 3,helmut = 2,wolf = 2,darha = 1,digits = 6},
    [303] = {ord = {M,L,S,L,S,M},snake = 2,helmut = 2,wolf = 3,darha = 2,digits = 6},
    [304] = {ord = {S,L,M,L,M,S},snake = 1,helmut = 3,wolf = 4,darha = 1,digits = 6},
    [305] = {ord = {S,S,M,L,M,L},snake = 3,helmut = 4,wolf = 4,darha = 1,digits = 6},
    [306] = {ord = {L,S,M,L,M,S},snake = 1,helmut = 4,wolf = 4,darha = 3,digits = 6},
    [307] = {ord = {S,M,L,S,L,S},snake = 1,helmut = 5,wolf = 5,darha = 1,digits = 6},
    [308] = {ord = {M,M,L,S,L,S},snake = 1,helmut = 5,wolf = 5,darha = 2,digits = 6},
    [309] = {ord = {S,S,L,M,L,M},snake = 2,helmut = 6,wolf = 5,darha = 1,digits = 6},
    [310] = {ord = {M,S,L,M,L,S},snake = 1,helmut = 6,wolf = 5,darha = 2,digits = 6},
-- Snares, Lucky Charm, Pocket Watch
    [401] = {ord = {M,S,L,S,M,L,S,S},snake = 1,helmut = 1,wolf = 1,darha = 2,digits = 8},
    [402] = {ord = {S,M,L,M,S,L,M,M},snake = 2,helmut = 1,wolf = 1,darha = 1,digits = 8},
    [403] = {ord = {L,M,S,S,S,M,L,M},snake = 2,helmut = 2,wolf = 2,darha = 3,digits = 8},
    [404] = {ord = {L,S,M,M,M,L,S,S},snake = 1,helmut = 3,wolf = 3,darha = 3,digits = 8},
    [405] = {ord = {S,L,M,M,M,S,L,L},snake = 3,helmut = 3,wolf = 3,darha = 1,digits = 8},
    [406] = {ord = {L,S,M,S,L,M,S,M},snake = 2,helmut = 4,wolf = 4,darha = 3,digits = 8},
    [407] = {ord = {M,S,L,S,M,L,S,L},snake = 3,helmut = 4,wolf = 4,darha = 2,digits = 8},
    [408] = {ord = {S,L,M,L,L,M,S,M},snake = 2,helmut = 5,wolf = 5,darha = 1,digits = 8},
    [409] = {ord = {M,L,S,L,L,S,M,S},snake = 1,helmut = 5,wolf = 5,darha = 2,digits = 8},
    [410] = {ord = {L,S,M,S,L,M,S,S},snake = 1,helmut = 6,wolf = 1,darha = 3,digits = 8},
-- Costume
    [501] = {ord = {S,M,L,M,S,M,L,S,L,M},snake = 2,helmut = 1,wolf = 1,darha = 1,digits = 10},
    [502] = {ord = {M,S,L,S,M,S,L,M,L,S},snake = 1,helmut = 1,wolf = 1,darha = 2,digits = 10},
    [503] = {ord = {M,L,S,L,M,L,S,M,S,L},snake = 3,helmut = 1,wolf = 1,darha = 2,digits = 10},
    [504] = {ord = {L,M,S,M,L,M,S,L,S,M},snake = 2,helmut = 1,wolf = 1,darha = 3,digits = 10},
    [505] = {ord = {M,L,S,L,M,L,S,L,S,M},snake = 2,helmut = 2,wolf = 2,darha = 2,digits = 10},
    [506] = {ord = {L,M,S,S,L,M,S,S,M,L},snake = 3,helmut = 3,wolf = 3,darha = 3,digits = 10},
    [507] = {ord = {S,L,M,L,S,L,M,S,M,L},snake = 3,helmut = 4,wolf = 4,darha = 1,digits = 10},
    [508] = {ord = {L,S,M,S,L,S,M,L,M,S},snake = 1,helmut = 4,wolf = 4,darha = 3,digits = 10},
    [509] = {ord = {S,L,M,M,S,L,M,M,S,L},snake = 3,helmut = 5,wolf = 5,darha = 1,digits = 10},
    [510] = {ord = {L,S,M,M,L,S,M,M,L,S},snake = 1,helmut = 5,wolf = 5,darha = 3,digits = 10},
};

function DeliverMessage(player)
    local s_order = player:getLocalVar("Bait_and_Switch_Quest_Order");
    local s_table = Switch_Table[s_order];
    local checkSwitch = player:getLocalVar("Switch_Table_Current");
    local numSwitches = s_table.digits;
    local message_offset = BAIT_AND_SWITCH_BASE;

    if (checkSwitch == numSwitches) then
        message_offset = BAIT_AND_SWITCH_BASE + 9;
        player:setLocalVar("Bait_and_Switch_Quest_Active",4);
    else
        message_offset = message_offset + checkSwitch - 1;
    end

    return message_offset;
end;

function AwardPrize(player)
    local Reward_Prize =
{
    [1] =  4165,  -- Silent Oil
    [2] =  4164,  -- Prism Powder
    [3] =  4116,  -- Hi-Potion
    [4] =  4132,  -- Hi-Ether
    [5] = 15880,  -- Key Ring Belt
    [6] =  5253,  -- Hermes Quencher
    [7] =  4213,  -- Icarus Wing
};
    return Reward_Prize[CheckOptionForItem(player)];
end;