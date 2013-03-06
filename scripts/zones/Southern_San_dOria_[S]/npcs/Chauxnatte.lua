-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Chauxnatte 
-- @zone 80
-- @pos 85 1 -51
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)


hasLicense = player:hasKeyItem(CHOCOBO_LICENSE);
level = player:getMainLvl();

	if (hasLicense and level >= 15) then
		player:startEvent(0x06A);
	else
		player:startEvent(0x06B);
	end

end;

  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
print("CSID:",csid);
print("OPTION:",option);


	if (csid == 0x06A and option == 0) then
       player:setPos(94,-62,266,40,81);
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
            
	end
	

end;