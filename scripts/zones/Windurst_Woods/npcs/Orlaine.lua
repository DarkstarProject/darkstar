-----------------------------------
--	CHOCOBO VENDOR
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");

function onTrigger(player,npc)
--license = player:hasKeyItem(CHOCOBO_LICENSE);
--level = player:getMainLvl();

--if (license == 1 and level >= 15) then
	player:startEvent(0x2712);
--end
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
--print("CSID:",csid);
print("OPTION:",option);


if (csid == 0x2712 and option == 0) then
   if (player:getMainLvl() >= 20) then
		
      player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	
   else

      player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	
   end
   player:setPos(-122,-4,-520,0,0x74);
end
end;