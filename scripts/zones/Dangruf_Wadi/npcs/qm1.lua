-----------------------------------
-- Area: Dangruf Wadi
-- NPC:  qm1
-- Type: spawns Chocoboleech
-- !pos  -430 4 115 191
-----------------------------------
package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Dangruf_Wadi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local x = npc:getXPos();
    local y = npc:getYPos();
    local z = npc:getZPos();
    local mob = GetMobByID(17559869);

    -- Trade Fresh Blood
    if (GetMobAction(17559869) == 0 and trade:hasItemQty(1898,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(17559869):updateClaim(player); -- Chocoboleech
        mob:setPos(x+1,y,z);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(SMALL_HOLE);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;