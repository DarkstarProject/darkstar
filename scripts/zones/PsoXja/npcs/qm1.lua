-----------------------------------
-- Area: Pso'xja
--  NPC: ??? (qm1)
-- Notes: Used to spawn Golden-Tongued Culberry
-- !pos -270.063 31.395 256.812 9
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/PsoXja/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    -- Trade Odorous knife or Odorous knife +1
    if (GetMobAction(16814432) == 0 and trade:hasItemQty(18014,1) and trade:getItemCount() == 1) then
          player:tradeComplete();
        SpawnMob(16814432):updateClaim(player);
        SetDropRate(1512, 13145, 500);
        npc:setStatus(STATUS_DISAPPEAR);
    elseif (GetMobAction(16814432) == 0 and trade:hasItemQty(18016,1) and trade:getItemCount() == 1) then
          player:tradeComplete();
        SpawnMob(16814432):updateClaim(player);
        SetDropRate(1512, 13145, 1000);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(BROKEN_KNIFE);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
