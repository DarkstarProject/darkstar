-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Death From Above NM)
-- Involved In Mission: Death From Above
-- @pos 53 1 -32 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    -- Trade Bee Larvae
    if (trade:hasItemQty(1267,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();
        SpawnMob(17428810,300):updateClaim(player);
        -- Note: The ??? reappears after 15 minutes
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NM_OFFSET + 4);
end;