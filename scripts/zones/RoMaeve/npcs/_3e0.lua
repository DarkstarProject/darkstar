-----------------------------------    
-- Area: Ro'Maeve
-- NPC:  _3e0 (Moongate)
-----------------------------------    

require("scripts/globals/settings");
require("scripts/globals/keyitems");

-----------------------------------    
-- onTrigger Action    
-----------------------------------    
    
function onTrigger(player,npc)
    if (player:hasKeyItem(MOONGATE_PASS) == true) then
        return -1;
    else
        return 1;
    end
end;    
    
-----------------------------------    
-- onTrade Action    
-----------------------------------    
    
function onTrade(player,npc,trade)    
end;    
    
-----------------------------------    
-- onEventSelection    
-----------------------------------    
    
function onEventUpdate(player,csid,menuchoice)    
end;    
    
-----------------------------------    
-- onEventFinish Action    
-----------------------------------    
    
function onEventFinish(player,csid,option)    
end;    

