-----------------------------------
-- Area: Promyvion-Vahzl
-- NPC:  ??? (qm2)
-- Notes: Spawn Wailer Floor 4
-- @pos 339.000 -1.883 144.000 22
-----------------------------------
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Promyvion-Vahzl/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(1757,1) and trade:getItemCount() == 1) then -- Coveter Remnant
        player:tradeComplete();
        player:messageSpecial(ON_NM_SPAWN);
        SpawnMob(16867544,180):updateClaim(player); -- Spawn Wailer
        npc:setStatus(STATUS_DISAPPEAR);
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(POPPED_NM_OFFSET+1);
end;