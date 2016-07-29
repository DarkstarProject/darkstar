-----------------------------------
-- Area: The_Garden_of_RuHmet
-- NPC:  ??? (Jailer of Fortitude Spawn)
-- Allows players to spawn the Jailer of Fortitude by trading 12 Ghrah M Chips to a ???.
-- @pos random ,-420 0 755, -43,0.00,460, -260,0.00,44.821, -580,0.00,43, -796,0.00,460
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Garden_of_RuHmet/TextIDs");
require("scripts/zones/The_Garden_of_RuHmet/MobIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade 12 Ghrah M Chips
    if (GetMobAction(Jailer_of_Fortitude) == 0 and trade:hasItemQty(1872,12) and trade:getItemCount() == 12) then
        local qm1 = GetNPCByID(Jailer_of_Fortitude_QM);
        -- Complete the trade
        player:tradeComplete();
        -- Hide the NPC, will become unhidden after Jailer of Fortitude despawns
        qm1:setStatus(STATUS_DISAPPEAR);
        -- Change MobSpawn to ???'s @pos. 
        GetMobByID(Jailer_of_Fortitude):setSpawn(qm1:getXPos(),qm1:getYPos(),qm1:getZPos()); 
        -- Change spawn point of pets to be at the ???'s pos as well
        GetMobByID(Kf_Ghrah_WHM):setSpawn(qm1:getXPos(),qm1:getYPos(),qm1:getZPos());
        GetMobByID(Kf_Ghrah_BLM):setSpawn(qm1:getXPos(),qm1:getYPos(),qm1:getZPos());
        -- Spawn Jailer of Fortitude
        SpawnMob(Jailer_of_Fortitude,180):updateClaim(player); 
        SpawnMob(Kf_Ghrah_WHM,180):updateClaim(player); 
        SpawnMob(Kf_Ghrah_BLM,180):updateClaim(player); 
    end
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
