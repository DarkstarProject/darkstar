-----------------------------------
-- ???
-- Area: Sacrarium
-----------------------------------
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 3 and player:hasKeyItem(RELIQUIARIUM_KEY)==false)then 
		-- print("pop");
		SpawnMob(16891970,240):updateEnmity(player);
		SpawnMob(16891971,240):updateEnmity(player);
		SpawnMob(16891972,240):updateEnmity(player);
	elseif(player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 4 and player:hasKeyItem(RELIQUIARIUM_KEY)==false)then
		player:addKeyItem(RELIQUIARIUM_KEY);
		player:messageSpecial(KEYITEM_OBTAINED,RELIQUIARIUM_KEY);
	else
		player:messageSpecial(7302);--There is nothing out of the ordinary here
	end
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end;
