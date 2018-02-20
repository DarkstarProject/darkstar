-----------------------------------
-- Area: Metalworks
--  NPC: Glarociquet, T.K.
-- !pos 19 -16 -28 237
-- X Grant Signet
-- X Recharge Emperor Band, Empress Band, or Chariot Band
-- X Accepts traded Crystals to fill up the Rank bar to open new Missions.
-- X Sells items in exchange for Conquest Points
-- X Start Supply Run Missions and offers a list of already-delivered supplies.
--   Start an Expeditionary Force by giving an E.F. region insignia to you.
-------------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/conquest");
require("scripts/globals/common");
require("scripts/zones/Metalworks/TextIDs");

local guardnation = NATION_SANDORIA; -- SANDORIA, BASTOK, WINDURST, JEUNO
local guardtype   = 2;        -- 1: city, 2: foreign, 3: outpost, 4: border
local size        = #SandInv;
local inventory   = SandInv;

function onTrade(player,npc,trade)
    tradeConquestGuard(player,npc,trade,guardnation,guardtype);
end;

function onTrigger(player,npc)

    if (player:getNation() == guardnation and player:getVar("supplyQuest_started") > 0 and supplyRunFresh(player) == 0) then
        player:showText(npc,CONQUEST + 40); -- "We will dispose of those unusable supplies."
        local region = player:getVar("supplyQuest_region");
        player:delKeyItem(getSupplyKey(region));
        player:messageSpecial(KEYITEM_OBTAINED + 1,getSupplyKey(region));
        player:setVar("supplyQuest_started",0);
        player:setVar("supplyQuest_region",0);
        player:setVar("supplyQuest_fresh",0);
    else
        local Menu1 = getArg1(guardnation,player);
        local Menu2 = getExForceAvailable(guardnation,player);
        local Menu3 = conquestRanking();
        local Menu4 = getSupplyAvailable(guardnation,player);
        local Menu5 = player:getNationTeleport(guardnation);
        local Menu6 = getArg6(player);
        local Menu7 = player:getCP();
        local Menu8 = getRewardExForce(guardnation,player);

        player:startEvent(32763,Menu1,Menu2,Menu3,Menu4,Menu5,Menu6,Menu7,Menu8);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdateCSID: %u",csid);
    -- printf("onUpdateOPTION: %u",option);

    updateConquestGuard(player,csid,option,size,inventory);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinishCSID: %u",csid);
    -- printf("onFinishOPTION: %u",option);

    finishConquestGuard(player,csid,option,size,inventory,guardnation);
end;
