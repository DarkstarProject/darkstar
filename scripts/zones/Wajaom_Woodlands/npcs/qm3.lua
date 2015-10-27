-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: ??? (Spawn Gotoh Zha the Redolent(ZNM T3))
-- @pos -337 -31 676 51
-----------------------------------
package.loaded["scripts/zones/Wajaom_Woodlands/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Wajaom_Woodlands/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 16986430;
    if (trade:hasItemQty(2575,1) and trade:getItemCount() == 1) then -- Trade Sheep Botfly
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