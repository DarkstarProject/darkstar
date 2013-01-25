-----------------------------------	
-- Small keyhole
-- Area: Sacrarium
-----------------------------------	
package.loaded["scripts/zones/Sacrarium/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Sacrarium/TextIDs");
	

	
-----------------------------------	
-- onTrigger Action	
-----------------------------------	
	
function onTrigger(player,npc)	
  player:messageSpecial(SMALL_KEYHOLE);	
end;	
	
	
-----------------------------------	
-- onTrade Action	
-----------------------------------	
	
function onTrade(player,npc,trade)	
  if (trade:hasItemQty(1659,1) and trade:getItemCount() == 1) then
    player:messageSpecial(CORAL_KEY_TRADE);
	SetServerVariable("SACRARIUM_Coral_Key_trade",os.time());
	player:tradeComplete();
	print(os.time());
  end
end;	
	

	
-----------------------------------	
-- onEventFinish Action	
-----------------------------------	
	
function onEventFinish(player,csid,option)	
	
end;	

