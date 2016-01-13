-----------------------------------
-- Area: Promyvion-Vahzl
--  NPC: ??? (qm1)
-- Notes: Spawn Deviator Floor 3
-- @pos 302.756 -2.244 -179.892 22
-----------------------------------

local text = require("scripts/zones/Promyvion-Vahzl/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(1756,1) and trade:getItemCount() == 1) then -- Cerebrator Remnant
        player:tradeComplete();
        player:messageSpecial(text.ON_NM_SPAWN);
        SpawnMob(16867455,180):updateClaim(player); -- Spawn Deviator
        npc:setStatus(STATUS_DISAPPEAR);
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(text.POPPED_NM_OFFSET);
end;