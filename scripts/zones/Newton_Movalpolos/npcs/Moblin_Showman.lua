-----------------------------------
-- Area: Newton Movalpolos
-- NPC:  Moblin Showman - Bugbear Matman
-- @pos 124.544 19.988 -60.670 12
-----------------------------------
package.loaded["scripts/zones/Newton_Movalpolos/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Newton_Movalpolos/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (GetMobAction(16826570) == 0 and trade:hasItemQty(1878,1) and trade:getItemCount() == 1) then -- Air tank 
        player:tradeComplete();
        player:showText(npc, SHOWMAN_ACCEPT); -- Moblin Showman's dialogue
        SpawnMob(16826570,300):updateClaim(player); -- Bugbear Matman
        npc:setStatus(STATUS_DISAPPEAR);
    else
        player:showText(npc, SHOWMAN_DECLINE); -- Moblin Showman refuses your trade
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
     player:showText(npc, SHOWMAN_TRIGGER);
end;