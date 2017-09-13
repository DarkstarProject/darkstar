-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: ??? (Spawn Chigre(ZNM T1))
-- !pos -217 35 12 68
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aydeewa_Subterrane/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17056186;
    if (trade:hasItemQty(1292,1) and trade:hasItemQty(1288,1) and trade:hasItemQty(1289,1) and trade:hasItemQty(1290,1) and trade:hasItemQty(1291,1) and trade:getItemCount() == 5) then -- Trade Spoilt Blood
        player:tradeComplete();
        SpawnMob(mobID):updateClaim(player);
        player:PrintToServer("*** A terrible beast has been spawned in the land... ***", 0x1C);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;