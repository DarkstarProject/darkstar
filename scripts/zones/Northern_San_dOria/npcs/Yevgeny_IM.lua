-----------------------------------
-- Area: Northern Sandoria
--  NPC: Yevgeny, I.M.
-- !pos 45 -1 0 231
-- X Grant Signet
-- X Recharge Emperor Band, Empress Band, or Chariot Band
-- X Accepts traded Crystals to fill up the Rank bar to open new Missions.
-- X Sells items in exchange for Conquest Points
-- X Start Supply Run Missions and offers a list of already-delivered supplies.
--   Start an Expeditionary Force by giving an E.F. region insignia to you.
-------------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/conquest");
require("scripts/globals/common");
require("scripts/zones/Northern_San_dOria/TextIDs");

local guardnation = dsp.conquest.NATION_BASTOK; -- SANDORIA, BASTOK, WINDURST, JEUNO
local guardtype   = 2;      -- 1: city, 2: foreign, 3: outpost, 4: border
local size        = #dsp.conquest.BASTOK_INVENTORY;
local inventory   = dsp.conquest.BASTOK_INVENTORY;

function onTrade(player,npc,trade)
    dsp.conquest.tradeConquestGuard(player,npc,trade,guardnation,guardtype);
end;

function onTrigger(player,npc)

    if (player:getNation() == guardnation and player:getVar("supplyQuest_started") > 0 and dsp.conquest.supplyRunFresh(player) == 0) then
        player:showText(npc,CONQUEST + 40); -- "We will dispose of those unusable supplies."
        local region = player:getVar("supplyQuest_region");
        player:delKeyItem(dsp.conquest.getSupplyKey(region));
        player:messageSpecial(KEYITEM_OBTAINED + 1,dsp.conquest.getSupplyKey(region));
        player:setVar("supplyQuest_started",0);
        player:setVar("supplyQuest_region",0);
        player:setVar("supplyQuest_fresh",0);
    else
        local Menu1 = dsp.conquest.getArg1(guardnation,player);
        local Menu2 = dsp.conquest.getExForceAvailable(guardnation,player);
        local Menu3 = dsp.conquest.conquestRanking();
        local Menu4 = dsp.conquest.getSupplyAvailable(guardnation,player);
        local Menu5 = player:getNationTeleport(guardnation);
        local Menu6 = dsp.conquest.getArg6(player);
        local Menu7 = player:getCP();
        local Menu8 = dsp.conquest.getRewardExForce(guardnation,player);

        player:startEvent(32761,Menu1,Menu2,Menu3,Menu4,Menu5,Menu6,Menu7,Menu8);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdateCSID: %u",csid);
    -- printf("onUpdateOPTION: %u",option);

    dsp.conquest.updateConquestGuard(player,csid,option,size,inventory);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinishCSID: %u",csid);
    -- printf("onFinishOPTION: %u",option);

    dsp.conquest.finishConquestGuard(player,csid,option,size,inventory,guardnation);
end;
