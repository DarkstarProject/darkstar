-----------------------------------
-- Area: Upper Jeuno
--  NPC: Emitt
-- !pos -95 0 160 244
-------------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/conquest");
require("scripts/zones/Upper_Jeuno/TextIDs");

local guardnation = OTHER; -- SANDORIA, BASTOK, WINDURST, OTHER(Jeuno).
local guardtype   = 1;     -- 1: city, 2: foreign, 3: outpost, 4: border

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    tradeConquestGuard(player,npc,trade,guardnation,guardtype);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local Menu1 = getArg1(guardnation,player);
    local Menu3 = conquestRanking();
    local Menu6 = getArg6(player);
    local Menu7 = player:getCP();

    player:startEvent(32763,Menu1,0,Menu3,0,0,Menu6,Menu7,0);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("onUpdateCSID: %u",csid);
    -- printf("onUpdateOPTION: %u",option);

    local inventory, size;
    if (player:getNation() == 0) then
        inventory = SandInv;
        size = #SandInv;
    elseif (player:getNation() == 1) then
        inventory = BastInv;
        size = #BastInv;
    else
        inventory = WindInv;
        size = #WindInv;
    end

    updateConquestGuard(player,csid,option,size,inventory);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onFinishCSID: %u",csid);
    -- printf("onFinishOPTION: %u",option);

    local inventory, size;
    if (player:getNation() == 0) then
        inventory = SandInv;
        size = #SandInv;
    elseif (player:getNation() == 1) then
        inventory = BastInv;
        size = #BastInv;
    else
        inventory = WindInv;
        size = #WindInv;
    end

    finishConquestGuard(player,csid,option,size,inventory,guardnation);
end;
