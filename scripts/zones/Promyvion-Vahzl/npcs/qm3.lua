-----------------------------------
-- Area: Promyvion-Vahzl
--  NPC: ??? (qm3)
-- Notes: Spawn Provoker Floor 5
-- @pos -260.000 -0.003 72.000 22
-----------------------------------

local text = require("scripts/zones/Promyvion-Vahzl/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(1758,1) and trade:getItemCount() == 1) then -- Satiator Remnant
        player:tradeComplete();
        player:messageSpecial(text.ON_NM_SPAWN);
        SpawnMob(16867642,180):updateClaim(player); -- Spawn Provoker
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(text.POPPED_NM_OFFSET+2);
end;