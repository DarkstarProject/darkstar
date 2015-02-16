-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Sajaaya
--  Type: Weather Checker
--  @pos -4.727 -6.999 -25.312 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	birth = 1009810800;
	timer = os.time();
	counter = (timer - birth);
	player:startEvent(0x01f6,0,0,0,0,0,0,0,counter);
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
--print("RESULT:",option);
end;
