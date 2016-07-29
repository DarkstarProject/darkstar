-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: ??? (Spawn Tinnin(ZNM T4))
-- @pos 278 0 -703 51
-----------------------------------
package.loaded["scripts/zones/Wajaom_Woodlands/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Wajaom_Woodlands/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 16986431;
    if (trade:hasItemQty(2573,1) and trade:getItemCount() == 1) then -- Trade Monkey wine
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