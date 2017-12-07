-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: ??? (Spawn Pandemonium Warden)
-- !pos 200 33 -140 68
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aydeewa_Subterrane/TextIDs");
require("scripts/zones/Aydeewa_Subterrane/MobIDs");

function onTrade(player,npc,trade)
    if (not GetMobByID(PANDEMONIUM_WARDEN):isSpawned() and trade:hasItemQty(2572,1) and trade:getItemCount() == 1) then -- Pandemonium key
        SpawnMob(PANDEMONIUM_WARDEN):updateClaim(player); -- Pandemonium Warden
        player:tradeComplete();
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;
