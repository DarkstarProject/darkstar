-----------------------------------
-- Area: Mount Zhayolm
-- Door: Runic Gate
-- @pos 703 -18 382 61
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:hasKeyItem(LEBROS_ASSAULT_ORDERS) and player:hasKeyItem(ASSAULT_ARMBAND)) then
        local assaultid = player:getVar("AssaultID");
        local recommendedLevel = player:getVar("AssaultRecLvl");
        player:startEvent(0x00CB, 22, -4, 0, recommendedLevel, 2, 1);
    else
    
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

    local cap = bit.band(option, 0x03);
    if (cap == 0) then
        cap = 99;
    elseif (cap == 1) then
        cap = 70;
    elseif (cap == 2) then
        cap = 60;
    else
        cap = 50;
    end
    
    --create instance
    --add leader and party
    
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
 printf("CSID: %u",csid);
 printf("RESULT: %u",option);
end;