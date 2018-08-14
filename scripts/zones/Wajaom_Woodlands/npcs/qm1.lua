-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: ??? (Spawn Vulpangue(ZNM T1))
-- !pos -697 -7 -123 51
-----------------------------------
package.loaded["scripts/zones/Wajaom_Woodlands/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Wajaom_Woodlands/TextIDs");
require("scripts/zones/Wajaom_Woodlands/MobIDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2580,1) and trade:getItemCount() == 1 and not GetMobByID(VULPANGUE):isSpawned()) then -- Trade Hellcage Butterfly
        player:tradeComplete();
        SpawnMob(VULPANGUE):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
