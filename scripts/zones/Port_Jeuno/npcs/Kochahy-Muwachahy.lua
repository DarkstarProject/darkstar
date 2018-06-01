-----------------------------------
-- Area: Port Jeuno
--  NPC: Kochahy-Muwachahy
-- !pos 40 0 6 246
-------------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/conquest");
require("scripts/zones/Port_Jeuno/TextIDs");

local guardnation = OTHER; -- SANDORIA, BASTOK, WINDURST, OTHER(Jeuno).
local guardtype   = 1;     -- 1: city, 2: foreign, 3: outpost, 4: border

function onTrade(player,npc,trade)
    dsp.conquest.tradeConquestGuard(player,npc,trade,guardnation,guardtype);
end;

function onTrigger(player,npc)
    local Menu1 = dsp.conquest.getArg1(guardnation,player);
    local Menu3 = dsp.conquest.conquestRanking();
    local Menu6 = dsp.conquest.getArg6(player);
    local Menu7 = player:getCP();

    player:startEvent(32763,Menu1,0,Menu3,0,0,Menu6,Menu7,0);
end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdateCSID: %u",csid);
    -- printf("onUpdateOPTION: %u",option);

    local inventory, size;
    if (player:getNation() == 0) then
        inventory = dsp.conquest.SANDORIA_INVENTORY;
        size = #dsp.conquest.SANDORIA_INVENTORY;
    elseif (player:getNation() == 1) then
        inventory = dsp.conquest.BASTOK_INVENTORY;
        size = #dsp.conquest.BASTOK_INVENTORY;
    else
        inventory = dsp.conquest.WINDURST_INVENTORY;
        size = #dsp.conquest.WINDURST_INVENTORY;
    end

    dsp.conquest.updateConquestGuard(player,csid,option,size,inventory);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinishCSID: %u",csid);
    -- printf("onFinishOPTION: %u",option);

    local inventory, size;
    if (player:getNation() == 0) then
        inventory = dsp.conquest.SANDORIA_INVENTORY;
        size = #dsp.conquest.SANDORIA_INVENTORY;
    elseif (player:getNation() == 1) then
        inventory = dsp.conquest.BASTOK_INVENTORY;
        size = #dsp.conquest.BASTOK_INVENTORY;
    else
        inventory = dsp.conquest.WINDURST_INVENTORY;
        size = #dsp.conquest.WINDURST_INVENTORY;
    end

    dsp.conquest.finishConquestGuard(player,csid,option,size,inventory,guardnation);
end;
