-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: ??? (Spawn Iriz Ima(ZNM T2))
-- !pos 253 -23 116 51
-----------------------------------
package.loaded["scripts/zones/Wajaom_Woodlands/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Wajaom_Woodlands/TextIDs");
require("scripts/zones/Wajaom_Woodlands/MobIDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2577,1) and trade:getItemCount() == 1 and not GetMobByID(IRIZ_IMA):isSpawned()) then -- Trade Senorita Pamamas
        player:tradeComplete();
        SpawnMob(IRIZ_IMA):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
