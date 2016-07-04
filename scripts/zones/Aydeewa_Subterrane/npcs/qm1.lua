-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: ??? (Spawn Nosferatu(ZNM T3))
-- @pos -199 8 -62 68
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aydeewa_Subterrane/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17056157;
    if (trade:hasItemQty(2584,1) and trade:getItemCount() == 1) then -- Trade Pure Blood
        if (GetMobAction(mobID) == ACTION_NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
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