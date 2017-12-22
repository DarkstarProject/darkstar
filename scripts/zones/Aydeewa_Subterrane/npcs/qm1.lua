-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: ??? (Spawn Nosferatu(ZNM T3))
-- !pos -199 8 -62 68
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aydeewa_Subterrane/TextIDs");
require("scripts/zones/Aydeewa_Subterrane/MobIDs");

function onTrade(player,npc,trade)
    if (not GetMobByID(NOSFERATU):isSpawned() and trade:hasItemQty(2584,1) and trade:getItemCount() == 1) then -- Pure Blood
        player:tradeComplete();
        SpawnMob(NOSFERATU):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;
