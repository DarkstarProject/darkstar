-----------------------------------
-- Area: Arrapago Reef
-- Door: Cutter
-- @pos -450 -10 -400 z 54
-----------------------------------

package.loaded["scripts/zones/The_Ashu_Talif/TextIDs"] = nil;
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/zones/Arrapago_Reef/TextIDs");
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/besieged");
require("scripts/zones/The_Ashu_Talif/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	    local assaultid = 53
        local recommendedLevel = 75
        local armband = 0;
       
        player:startEvent(0x00DD, assaultid, 250, 0, recommendedLevel, 6, armband);

-- player:startEvent(0x00DD, 53, 250, 0, 75, 6);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,target)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
   

    local assaultid = player:getCurrentAssault();
    
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
    
    player:setVar("AssaultCap", cap);
                
    local party = player:getParty();
    
    if (party ~= nil) then
           player:instanceEntry(target,1);
    end
    
    player:createInstance(player:getCurrentAssault(), 60);
    

end; 
-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,target)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
 
     if (csid == 0xDD ) then
        player:setPos(0,-10,0,0,60);
    end
end;
 

-----------------------------------
-- onInstanceLoaded
-----------------------------------

function onInstanceCreated(player,instance,target)
printf("instace %u",instance)
    if (instance) then
        instance:setLevelCap(player:getVar("AssaultCap"));
        player:setVar("AssaultCap", 0);
        player:setInstance(instance);
        player:instanceEntry(target,4);
        if (party ~= nil) then
            for i,v in ipairs(party) do
                if v:getID() ~= player:getID() and v:getZoneID() == player:getZoneID() then
                    v:setInstance(instance);
                    v:startEvent(0xD0, 2);
       
                end
            end
        end
    else
        player:messageText(target,CANNOT_ENTER, false);
        player:instanceEntry(target,3);
    end
end;

