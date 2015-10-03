-- Zone: Abyssea-La Theine
--  NPC: ??? Qm3
-- Spawns King Arthro
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (trade:hasItemQty(539,1) == true and trade:getItemCount() == 1) then 
            -- Player has all the required items so Spawn NM. 
            -- Despawn after inactive for 300 sec (pt has to reclaim within 5 min of a wipe)
            SpawnMob(17203216, 300):updateEnmity(player); 
            player:tradeComplete();
    end
end;