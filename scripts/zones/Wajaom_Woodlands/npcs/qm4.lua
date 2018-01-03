-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: ??? (Spawn Tinnin(ZNM T4))
-- !pos 278 0 -703 51
-----------------------------------
package.loaded["scripts/zones/Wajaom_Woodlands/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Wajaom_Woodlands/TextIDs");
require("scripts/zones/Wajaom_Woodlands/MobIDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2573,1) and trade:getItemCount() == 1 and not GetMobByID(TINNIN):isSpawned()) then -- Trade Monkey wine
        player:tradeComplete();
        SpawnMob(TINNIN):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
