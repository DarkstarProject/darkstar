-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Beryl-footed Molberry NM)
-- @pos -57 0 4 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    respawn = GetServerVariable("[POP]Beryl-footed_Molberry");
    
    -- Trade Tonberry Rattle
    if (trade:hasItemQty(1266,1) and trade:getItemCount() == 1 and respawn <= os.time(t)) then 
        player:tradeComplete();
        SpawnMob(17428809,300):updateClaim(player);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NM_OFFSET);
end;