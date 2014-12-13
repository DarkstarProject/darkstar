-----------------------------------
-- Area: The_Garden_of_RuHmet
-- NPC:  ??? (Jailer of Fortitude Spawn)
-- Allows players to spawn the Jailer of Fortitude by trading 12 Ghrah M Chips to a ???.
-- @pos random ,-420 0 755, -43,0.00,460, -260,0.00,44.821, -580,0.00,43, -796,0.00,460
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Garden_of_RuHmet/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobspawn = GetMobByID(16921015); 
    local qm1 = GetNPCByID(16921027);
    -- Trade 12 Ghrah M Chips
    --[[if (GetMobAction(16921015) == 0 and trade:hasItemQty(1872,12) and trade:getItemCount() == 12) then
            player:tradeComplete();
            qm1:hideNPC(900); -- hides the ??? for 15 mins, in seconds.
            mobspawn:setSpawn(player:getXPos(),player:getYPos(),player:getZPos()); -- Change MobSpawn to Players @pos.
            SpawnMob(16921015,180):updateEnmity(player); -- Spawn Jailer of Fortitude
    end]]
end;               
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
end;