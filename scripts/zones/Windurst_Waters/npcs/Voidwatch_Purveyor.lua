-----------------------------------
-- Zone: Windurst Water
-- NPC: Voidwatch Purveyor
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();


itemQuality = 0;

if(trade:hasItemQty(15070,1) == true and trade:getItemCount() == 1) then 
player:tradeComplete();
		 player:addKeyItem(VOIDSTONE1); -- Voidstone
		 player:addKeyItem(CRIMSON_STRATUM_ABYSSITE)
end
   
  
   

end; 	